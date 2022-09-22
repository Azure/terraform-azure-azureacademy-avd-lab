[DSCLocalConfigurationManager()]
Configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            # ConfigurationModeFrequencyMins = 20
            RebootNodeIfNeeded = $true
            ActionAfterReboot  = 'ContinueConfiguration'
            ConfigurationMode  = 'ApplyAndMonitor'
        }
    }
}

LCMConfig -OutputPath "C:\DSCConfigs"
Set-DscLocalConfigurationManager -Path "C:\DSCConfigs"
Get-DscLocalConfigurationManager