@ECHO OFF

set currentPath=%~dp0
set performanceToolsPath=%currentPath%Team Tools\Performance Tools\x64
set snPath=%currentPath%Team Tools\Sn
set keyPath=%currentPath%OCPKey.snk
set filePath=%1
set appPath=%2


echo file path: %filePath%
echo app path: %appPath%

For /f "tokens=1* delims=:" %%i in ('Type %filePath%^|Findstr /n ".*"') do ( 
	echo Start to instument: %appPath%\%%j
	"%performanceToolsPath%\vsinstr.exe" /coverage %appPath%\%%j
	REM Re-sign via sn.exe since assambly will be remove strong sign after instument
	echo Start to re-sign: %appPath%\%%j
	"%snPath%\sn.exe" -Ra %appPath%\%%j %keyPath%
)