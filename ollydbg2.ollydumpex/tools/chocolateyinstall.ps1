$ErrorActionPreference = 'Stop';
$packageName = 'OllyDbg2'

$toolsDir = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir 'OllyDbg2'

$zipDir = Join-Path $toolsDir 'OllyDumpEx_v1.50'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://low-priority.appspot.com/ollydumpex/OllyDumpEx.zip'
  checksum      = 'a7fc263e1c5a096801f320c4d2a949a801928c4965c11f7913bed29cfd70d029'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$pluginFile = 'OllyDumpEx_Od20.dll'
$pluginZipPath = Join-Path $zipDir $pluginFile
$pluginToolsPath = Join-Path $toolsDir $pluginFile

# Move correct plugin into the tool directory
Move-Item -Path $pluginZipPath -Destination $pluginToolsPath -Force -ErrorAction Stop

# Delete temporary download directory
Remove-Item -Path $zipDir -Recurse