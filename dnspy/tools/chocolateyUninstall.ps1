$ErrorActionPreference = 'Stop';
$packageName = 'dnspy'

$toolsDir = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir $packageName
$shortcut = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\" + $packageName + ".lnk"

Remove-Item $toolsDir -Recurse
Remove-Item $shortcut