@ECHO OFF

set currentPath=%~dp0
set logPath=%currentPath%Logs

IF NOT EXIST "%logPath%" MD %logPath%

call %currentPath%init_codecoverage.bat

REM Run test cases
set kafPath=C:\Program Files (x86)\KAF
set testPath=C:\Program Files (x86)\Testing\BizOpsTools
set controllerTestCasePath="%testPath%\Microsoft.Commerce.Tools.Test.BizOpsTools.ControllerTest.dll"
set backendJobTestCasePath="%testPath%\Microsoft.Commerce.Tools.Test.BizOpsTools.BackendJobTest.dll"
set uiTestCasePath="%testPath%\Microsoft.Commerce.Tools.Test.BizOpsTools.WebClientTest.dll"
REM "%kafPath%\Latch.exe" %controllerTestCasePath% /select:"FunctionName='BatchTool_APITest_AdminExtendSubs$'" 
REM "%kafPath%\Latch.exe" %controllerTestCasePath% /select:"FunctionName='InvoiceAdminTool_FuncTest_BillingOperateWithDirectInput$'"
REM "%kafPath%\Latch.exe" %controllerTestCasePath% /select:"FunctionName='ModernPMT_FuncTest_ExportAllRequests$'" 
REM "%kafPath%\Latch.exe" %backendJobTestCasePath% /select:"FunctionName='BackendJobs_BasicFunction$'"
REM "%kafPath%\Latch.exe" %uiTestCasePath% /select:"FunctionName='BatchTool_UITest_TestNewEntryPoint$'"

call %currentPath%post_codecoverage.bat