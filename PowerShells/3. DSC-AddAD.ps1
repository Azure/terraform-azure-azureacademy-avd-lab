# $DomainName = "contoso.com"
# $Username = "localadmin"
# $Password = "SuperSecretPassword"
# $SecurePassword = ConvertTo-SecureString -AsPlainText -String $Password -Force
# & './3. DSC-AddAD.ps1' -DomainName $DomainName -Username "localadmin" -SecurePassword $SecurePassword


[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [String] $DomainName,
    
    [Parameter(Mandatory)]
    [String] $Username,

    [Parameter(Mandatory)]
    [System.Security.SecureString] $SecurePassword
)

$FullUsername = "$DomainName\$Username"
$Credentials = New-Object System.Management.Automation.PSCredential $FullUsername, $SecurePassword

Configuration ADDomainController_AddDomainControllerToDomainMinimal_Config {
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $SafeModePassword,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        $DomainName
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName ActiveDirectoryDsc
    Import-DscResource -Module ComputerManagementDsc

    node localhost
    {
        LocalConfigurationManager
        {
            RebootNodeIfNeeded = $true
            ActionAfterReboot  = 'ContinueConfiguration'
            ConfigurationMode  = 'ApplyAndMonitor'
        }
      
        WindowsFeature 'InstallADDomainServicesFeature'
        {
            Ensure = 'Present'
            Name   = 'AD-Domain-Services'
        }

        WindowsFeature 'InstallRSATRoleTools'
        {
            Ensure = 'Present'
            Name   = 'RSAT-Role-Tools'
        }

        WindowsFeature 'InstallRSATADDSTools'
        {
            Ensure = 'Present'
            Name   = 'RSAT-ADDS-Tools'
        }

        WindowsFeature 'InstallRSATADDS'
        {
            Ensure = 'Present'
            Name   = 'RSAT-ADDS'
        }
        WindowsFeature 'InstallRSAT-AD-AdminCenter'
        {
            Ensure = 'Present'
            Name   = 'RSAT-AD-AdminCenter'
        }

        WindowsFeature 'RSATADPowerShell'
        {
            Ensure    = 'Present'
            Name      = 'RSAT-AD-PowerShell'
            DependsOn = '[WindowsFeature]InstallADDomainServicesFeature'
        }

        WaitForADDomain 'WaitForestAvailability'
        {
            DomainName = $DomainName
            Credential = $Credential
            WaitTimeout = 600

            DependsOn  = '[WindowsFeature]RSATADPowerShell'
        }

        ADDomainController 'DomainControllerMinimal'
        {
            DomainName                    = $DomainName
            Credential                    = $Credential
            SafeModeAdministratorPassword = $SafeModePassword
            DependsOn                     = '[WaitForADDomain]WaitForestAvailability'
        }

        PendingReboot 'CheckADPendingReboot'
        {
            Name              = "CheckADPendingReboot"
            DependsOn         = '[ADDomainController]DomainControllerMinimal'
            SkipWindowsUpdate = $true
        }
    }
}

$ConfigurationData = @{
    AllNodes = @(
        @{
            NodeName                    = 'localhost'
            PSDscAllowPlainTextPassword = $true
            PSDSCAllowDomainUser        = $true
        }
    )
}

ADDomainController_AddDomainControllerToDomainMinimal_Config -Credential $Credentials -SafeModePassword $Credentials -DomainName $DomainName -ConfigurationData $ConfigurationData
Start-Dscconfiguration -Wait -Verbose -Path ./ADDomainController_AddDomainControllerToDomainMinimal_Config -Force
