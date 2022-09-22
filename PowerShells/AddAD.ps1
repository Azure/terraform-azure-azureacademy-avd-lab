param ($DomainName, $SafeModeAdministratorPassword, $Username)

Add-WindowsFeature AD-Domain-Services
ADD-WindowsFeature RSAT-Role-Tools

# $DomainName = "contoso.com"
# $SafeModeAdministratorPassword = "supersecretpassword"
# $Username = "localadmin"
$SecureSafeModeAdministratorPassword = ConvertTo-SecureString -AsPlainText -String $SafeModeAdministratorPassword -Force
$User = "$DomainName\$Username"
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $SecureSafeModeAdministratorPassword
$stopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
$stopWatch.Start()
Do {
    Install-AddsDomainController -domainname $DomainName -credential $Credential -SafeModeAdministratorPassword $SecureSafeModeAdministratorPassword -Force
    if (($LASTEXITCODE -ge 1) -and ($LASTEXITCODE -le 4)) {
        # Codes between 1 & 4 are success codes as per
        # https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/deploy/troubleshooting-domain-controller-deployment
        return 0
    }
    if ($stopWatch.Elapsed.Minutes -ge 15) {
        # If this is taking more than 15 minutes, something is not right
        return 1
    }
    Start-Sleep -Seconds 10
} While ($true)
