$ErrorActionPreference = 'Stop';
$packageName = 'dnspy'

$toolsDir = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir $packageName


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/0xd4d/dnSpy/releases/download/v3.0.0/dnSpy.zip'
  checksum      = '99c0e7bdc93e8051e7e4f09ff75c38ce77119de4a5434cd0cb6aaaf0f71a4ce2'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$target = Join-Path $toolsDir "dnSpy.exe"
$shortcut = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\" + $packageName + ".lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcut -targetPath $target