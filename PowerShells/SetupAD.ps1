param ($DomainName, $SafeModeAdministratorPassword)
$SecureSafeModeAdministratorPassword = ConvertTo-SecureString -AsPlainText -String $SafeModeAdministratorPassword -Force
Add-WindowsFeature AD-Domain-Services
ADD-WindowsFeature RSAT-Role-Tools
Install-ADDSForest -DomainName $DomainName -InstallDNS -SafeModeAdministratorPassword $SecureSafeModeAdministratorPassword -Force
