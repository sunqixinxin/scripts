@ECHO OFF

set currentPath=%~dp0
set codeCoverageResultPath=%currentPath%Result
set performanceToolsPath=%currentPath%Team Tools\Performance Tools\x64
set coverageFileName=bizopstools
set visualCoveragePath=%currentPath%\VisualCoverage
set rootFilePath=%currentPath%Assembly\root.txt
set /p rootPath=<%rootFilePath%

REM Stop all process whose assemblies need be get code coverage against
iisreset /stop
TASKKILL /F /IM ToolsBackendService.JobScheduler.exe
TASKKILL /F /IM ToolsBackendService.JobContainer.exe
TASKKILL /F /IM BatchScheduler.exe

REM End vsperfcmd to collect code coverage
"%performanceToolsPath%\vsperfcmd.exe" /shutdown

REM Parse code coverage file to html and xml file
"%visualCoveragePath%\VisualCoverage.exe" --input %codeCoverageResultPath%\%coverageFileName%.coverage --clover "%codeCoverageResultPath%\%coverageFileName%_clover.xml" --html "%codeCoverageResultPath%\%coverageFileName%_report.html"

REM Start processes
iisreset /start
pushd "%rootPath%\ToolsBackendService"
start start.bat
popd
pushd "%rootPath%\BatchScheduler"
start start.bat
popd