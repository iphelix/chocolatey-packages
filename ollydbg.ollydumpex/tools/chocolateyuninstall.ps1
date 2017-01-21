$ErrorActionPreference = 'Stop';
$packageName = 'OllyDbg'

$toolsDir = ${Env:ProgramFiles(x86)}
if(-Not ($toolsDir)) {
  $toolsDir = ${Env:ProgramFiles}
}
$toolsDir = Join-Path $toolsDir $packageName

$pluginFile = 'OllyDumpEx_Od11.dll'
$pluginToolsPath = Join-Path $toolsDir $pluginFile

Remove-Item $pluginToolsPath