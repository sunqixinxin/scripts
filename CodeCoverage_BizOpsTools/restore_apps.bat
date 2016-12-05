@ECHO OFF

set currentPath=%~dp0
set rootFilePath=%currentPath%Assembly\root.txt
set /p rootPath=<%rootFilePath%
set logPath=%currentPath%Logs

IF NOT EXIST "%logPath%" MD %logPath%

REM Stop all process whose assemblies need be get code coverage against
iisreset /stop
TASKKILL /F /IM ToolsBackendService.JobScheduler.exe
TASKKILL /F /IM ToolsBackendService.JobContainer.exe
TASKKILL /F /IM BatchScheduler.exe

REM restore app assamblies that need to be collected code coverage.
REM 1. BizOpsTools
set appName=BizOpsTools
call %currentPath%restore_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\restore_%appName%.log"
REM 2. ToolsService
set appName=ToolsService
call %currentPath%restore_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\restore_%appName%.log"
REM 3. BatchService
set appName=BatchService
call %currentPath%restore_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\restore_%appName%.log"
REM 4. ToolsBackendService
set appName=ToolsBackendService
call %currentPath%restore_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\restore_%appName%.log"
REM 5. BatchScheduler
set appName=BatchScheduler
call %currentPath%restore_assemblies.bat "%currentPath%Assembly\%appName%.txt" "%rootPath%\%appName%">"%logPath%\restore_%appName%.log"

REM Start processes
iisreset /start
pushd "%rootPath%\ToolsBackendService"
start start.bat
popd
pushd "%rootPath%\BatchScheduler"
start start.bat
popd