@echo off

set fromPath=%CD%
set batName=%~nx0
set newExtendName=.mp3

pushd .. 
SET toPath=%CD%\updatedfiles\
popd

if exist "%toPath%" del "%toPath%" /s /q
xcopy %fromPath% %toPath% /s /e /y

for /r %toPath% %%i in (*) do (
	if %%~nxi == %batName% (del %%i /F) ELSE ren %%~fi %%~ni%newExtendName%
)