@echo off

:setvars
:: need user input
:: must
set dllfullpath=""
:: not must
set proxyfilefullpath=""

set in=
set dllpath=
set svcutilpath="%C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\NETFX 4.0 Tools%"
set defaultproxyfilename=WebServiceProxy.cs

:parseargs
if "%1"=="/?" (
	goto :usage
)

if "%1"=="" (
	goto :checkargs
) else if /I "%1"=="-dll" (
	set dllfullpath="%2"
	shift
) else if /I "%1"=="-cs" (
	set proxyfilefullpath="%2"
	shift
) else goto :checkargs
shift
goto :parseargs

:checkargs:
if %dllfullpath%=="" goto :input
if %proxyfilefullpath%=="" goto :input

:begin
c:
cd %svcutilpath%
set generatefilepath=%dllpath%GFile
if %proxyfilefullpath%=="" set proxyfilefullpath="%generatefilepath%\%defaultproxyfilename%"
SvcUtil.exe %dllfullpath% /directory:"%generatefilepath%"

if %errorlevel% NEQ 0 (
	pause
) else (
	svcutil.exe /t:code "%generatefilepath%\*.wsdl" "%generatefilepath%\*.xsd" /o:%proxyfilefullpath%
)
goto :end

:input
:inputDllFullPath
set in=
set /p in=please input dll full path:

if "%in%"=="" (
	goto :inputDllFullPath
) else if not exist "%in%" (
	echo "%in%" not exist.
	goto :inputDllFullPath
) else (
	set dllfullpath="%in%"
	for %%a in ("%in%") do set dllpath=%%~dpa
)
::ProxyFileFullPath
set in=
set /p in=please input full path of proxy file need to be generated:
set proxyfilefullpath="%in%"
goto :begin

:usage
@echo -----------------------usage--------------------------------------
@echo -dll:dll full path
@echo -cs:full path of proxy file need to be generated
@echo.
@echo demo1: svc.cmd
@echo demo2: svc.cmd -dll E:\Svcutil\BillAdmin\Microsoft.Commerce.Billing.Admin.Service.dll -cs E:\Svcutil\BillAdmin\123.cs
@echo -----------------------usage--------------------------------------

:end
pause