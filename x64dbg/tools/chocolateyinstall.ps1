$ErrorActionPreference = 'Stop';
$packageName = 'x64dbg'

# Retrieve URL for the latest released on github. The releases are frequent!
# NOTE: Requires PS3+ for this to work.
#$r = Invoke-WebRequest 'https://api.github.com/repos/x64dbg/x64dbg/releases/latest'
#$j = $r | ConvertFrom-Json
#$url = $j.assets.browser_download_url

$url = 'https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_2017-01-19_21-26.zip'

$toolsDir = ${Env:ProgramFiles}
$toolsDir = Join-Path $toolsDir $packageName

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '0959e12ee4d9c2e959fa2d1732a1673d873a99ee185053e5511029cda0beed0a'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs


$target32 = Join-Path $toolsDir "release\x32\x32dbg.exe"
$shortcut32 = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\x32dbg.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcut32 -targetPath $target32

$target64 = Join-Path $toolsDir "release\x64\x64dbg.exe"
$shortcut64 = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\x64dbg.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcut64 -targetPath $target64