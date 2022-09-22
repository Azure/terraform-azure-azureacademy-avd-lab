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

Configuration AzureSetupADDomain {
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

    Node localhost
    {
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

        ADDomain 'PDC'
        {
            DomainName                    = $DomainName
            Credential                    = $Credential
            SafemodeAdministratorPassword = $SafeModePassword
            ForestMode                    = 'WinThreshold'
        }

        PendingReboot 'CheckADPendingReboot'
        {
            Name              = "CheckADPendingReboot"
            SkipWindowsUpdate = $true
            DependsOn         = '[ADDomain]PDC'
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
