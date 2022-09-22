# Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
# Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Install-Module -Name ActiveDirectoryDsc, ComputerManagementDsc -Repository PSGallery

$ConfigString=@"
Configuration SetupNuget {
    Import-DscResource -ModuleName PackageManagement
    Import-DscResource -ModuleName PowerShellModule

    Node localhost
    {
        PackageManagementSource SourceRepository
        {
            Ensure      = "Present"
            Name        = "MyNuget"
            ProviderName= "Nuget"
            SourceUri   = "http://nuget.org/api/v2/"
            InstallationPolicy ="Trusted"
        }

        PSModuleResrouce ActiveDirectoryDsc
        {
            Ensure      = "Present"
            Module_name = "ActiveDirectoryDsc"
        }

        PSModuleResrouce ComputerManagementDsc
        {
            Ensure      = "Present"
            Module_name = "ComputerManagementDsc"
        }
    }
}
"@

Invoke-Expression $ConfigString
SetupNuget
Start-Dscconfiguration -Wait -Verbose -Path ./SetupNuget -Force