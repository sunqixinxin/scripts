@echo off
set bitspath="d:\ToolsServices1"
Set appcmdpath=%SystemRoot%\System32\inetsrv

Set apppoolname="ToolsServices1"
Set sitename="Default Web Site"
Set applicationpath="/ToolsServices1"
set siteappname="Default Web Site/ToolsServices1"


cd  %appcmdpath%

:clear
appcmd delete app %siteappname%
appcmd delete apppool %apppoolname%
del /s /q %bitspath%

md %bitspath%
xcopy \\tsclient\E\ToolsService %bitspath% /e /y /r
Appcmd add apppool /name:%apppoolname% -processModel.identityType:NetworkService -managedRuntimeVersion:v4.0
Appcmd add app /site.name:%sitename% /path:%applicationpath% /physicalpath:%bitspath% -applicationPool:%apppoolname%
pause