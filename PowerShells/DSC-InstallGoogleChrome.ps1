# Installs the latest version of Chrome in the language specified in the parameter Language.

Configuration Sample_InstallChromeBrowser {
    param
    (
        [Parameter(Mandatory)]
        $Language,
 
        [Parameter(Mandatory)]
        $LocalPath
 
    )
 
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -module xChrome
 
    MSFT_xChrome chrome
    {
        Language = $Language
        LocalPath = $LocalPath
    }
}

Sample_InstallChromeBrowser -Language "EN" -LocalPath "C:\Users\localadmin\Desktop\ChromeSetup.exe"
start-dscconfiguration -wait -verbose -path ./Sample_InstallChromeBrowser -force 
 