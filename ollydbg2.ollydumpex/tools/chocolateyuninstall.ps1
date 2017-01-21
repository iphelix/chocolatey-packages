$ErrorActionPreference = 'Stop';
$packageName = 'OllyDbg2'

$toolsDir = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir $packageName

$pluginFile = 'OllyDumpEx_Od20.dll'
$pluginToolsPath = Join-Path $toolsDir $pluginFile

Remove-Item $pluginToolsPath