rem @echo off

set fromPath=%~dp0
set batName=%~sdp0
rem set fromPath=C:\SourceCode\scripts\test
set toPath=C:\SourceCode\scripts\test1\
rem set toPath=%~dp0updatedfiles
set newExtendName=.mp4

xcopy %fromPath% %toPath% /s /e /y /include %%~ni

for /r %toPath% %%i in (*) do (
	ren %%~fi %%~ni%newExtendName%
)