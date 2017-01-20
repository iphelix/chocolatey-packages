$ErrorActionPreference = 'Stop'
$packageName= 'OllyDbg2'

$toolsDir   = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir $packageName

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'http://www.ollydbg.de/odbg201.zip'
  checksum      = '29244e551be31f347db00503c512058086f55b43c93c1ae93729b15ce6e087a5'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$target = Join-Path $toolsDir "ollydbg.exe"
$shortcut = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\" + $packageName + ".lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcut -targetPath $target