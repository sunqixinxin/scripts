@ECHO OFF

set currentPath=%~dp0
set codeCoverageResultPath=%currentPath%Result
set visualCoveragePath=%currentPath%\VisualCoverage
set coverageFileName=bizopstools

"%visualCoveragePath%\VisualCoverage.exe" --input %codeCoverageResultPath%\%coverageFileName%.coverage --clover "%codeCoverageResultPath%\%coverageFileName%_clover.xml" --html "%codeCoverageResultPath%\%coverageFileName%_report.html"
