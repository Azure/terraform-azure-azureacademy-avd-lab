# Set required variables
param ($TenantID, $SubscriptionId, $ApplicationID, $ServicePrincipalPassword)

# Install Azure Active Directory module
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module AZ
Install-Module AzureAD

# Download AzFilesHybrid PowerShell module & extract it
Invoke-WebRequest -Uri "https://github.com/Azure-Samples/azure-files-samples/releases/download/v0.2.4/AzFilesHybrid.zip" -OutFile "AzFilesHybrid.zip"
Expand-Archive -LiteralPath AzFilesHybrid.zip -DestinationPath AzFilesHybrid
Set-Location AzFilesHybrid\AzFilesHybrid

# Install AzFilesHybrid PowerShell
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
.\CopyToPSPath.ps1
Install-Module -Name PowerShellGet -Force
Import-Module -Name AzFilesHybrid -Force

# Connect to Azure
$SecurePassword = ConvertTo-SecureString -AsPlainText -String $ServicePrincipalPassword -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationID, $SecurePassword
Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential
Select-AzSubscription -SubscriptionId $SubscriptionId 
