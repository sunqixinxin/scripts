set remoteMachine=10.156.64.116
set userName=Administrator
set password=#Bugsfor$
set sessionid=1
set remoteFolder=\\%remoteMachine%\c$\remote\

:GetActiveSession
REM Get Active session ID.
psexec.exe -accepteula -u %userName% -p %password% \\%remoteMachine% cmd.exe /c Query user %userName% >SessionInfo.txt
set sessionidfound=false
for /f "tokens=1,2,3 delims= " %%i in (SessionInfo.txt) do (
    IF /I %userName%==%%i (
		set sessionid=%%k
		set sessionidfound=true
	)
)
IF /I "%sessionid%"=="disc" (
	set sessionidfound=false
)
del SessionInfo.txt /q
if /I "%sessionidfound%"=="false" (
	ECHO Cannot found active id for user %userName% on box %remoteMachine%, please log on this 1box with user %userName%. Wait for 1 minute.
	sleep 60
	goto :GetActiveSession
)

net use \\%remoteMachine% %password% /u:%userName%
xcopy /y "%~dp0test.bat" %remoteFolder%
psexec.exe -accepteula -u %userName% -p %password% \\%remoteMachine% -i %sessionid% %remoteFolder%test.bat