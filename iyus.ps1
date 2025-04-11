
netsh advfirewall set allprofiles state off

Set-MpPreference -DisableRealtimeMonitoring $true

sc stop WinDefend
sc config WinDefend start= disabled

reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v TamperProtection /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
