$ErrorActionPreference = 'Stop';
$packageName = 'x64dbg'

$toolsDir = ${Env:ProgramFiles}
$toolsDir = Join-Path $toolsDir $packageName

$shortcut32 = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\x32dbg.lnk"
$shortcut64 = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\x64dbg.lnk"

Remove-Item $toolsDir -Recurse
Remove-Item $shortcut32
Remove-Item $shortcut64