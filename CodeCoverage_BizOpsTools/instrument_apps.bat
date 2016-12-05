@ECHO OFF

set currentPath=%~dp0
set rootFilePath=%currentPath%Assembly\root.txt
set /p rootPath=<%rootFilePath%
set logPath=%currentPath%Logs

IF NOT EXIST "%logPath%" MD %logPath%

iisreset

REM Instument app assamblies that need to be collected code coverage.
REM 1. BizOpsTools
set appName=BizOpsTools
call %currentPath%instrument_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\instrument_%appName%.log"
REM 2. ToolsService
set appName=ToolsService
call %currentPath%instrument_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\instrument_%appName%.log"
REM 3. BatchService
set appName=BatchService
call %currentPath%instrument_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\instrument_%appName%.log"
REM 4. ToolsBackendService
set appName=ToolsBackendService
TASKKILL /F /IM ToolsBackendService.JobScheduler.exe
TASKKILL /F /IM ToolsBackendService.JobContainer.exe
call %currentPath%instrument_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\instrument_%appName%.log"
pushd "%rootPath%\%appName%"
start start.bat
timeout 5
popd

REM 5. BatchScheduler
TASKKILL /F /IM BatchScheduler.exe
set appName=BatchScheduler
call %currentPath%instrument_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\instrument_%appName%.log"
pushd "%rootPath%\%appName%"
start start.bat
timeout 15
popd