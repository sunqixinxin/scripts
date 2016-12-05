@ECHO OFF

set currentPath=%~dp0
set codeCoverageResultPath=%currentPath%Result
set performanceToolsPath=%currentPath%Team Tools\Performance Tools\x64
set coverageFileName=bizopstools
set logPath=%currentPath%Logs

IF NOT EXIST "%logPath%" MD %logPath%

REM Copy VSCover110.dll to system32
set fromPath=%currentPath%Dlls\VSCover110.dll
set toPath=C:\Windows\System32
copy /y %fromPath% %toPath%
IF %ERRORLEVEL% NEQ 0 echo Met error when copy VSCover110.dll to system32.

REM Register msdia110.dll
REM regsvr32 /s "%currentPath%Team Tools\Dynamic Code Coverage Tools\msdia110.dll"
regsvr32 /s "%currentPath%Dlls\msdia110.dll"
IF %ERRORLEVEL% NEQ 0 echo Met error when register msdia110.dll.

REM Instument app's assemblies
echo ==================start instument==========================
call %currentPath%instrument_apps.bat
echo ==================end instument==========================

REM Start perfcmd to collect code coverage
erase /Q "%codeCoverageResultPath%\%coverageFileName%.*"
"%performanceToolsPath%\vsperfcmd.exe" /start:coverage /output:"%codeCoverageResultPath%\%coverageFileName%" /cs /User:"Everyone"