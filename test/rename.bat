@echo off

set fromPath=%CD%
set batName=%~nx0

pushd .. 
SET toPath=%CD%\updatedfiles\
popd

set newExtendName=.mp3
if exist "%toPath%" del "%toPath%" /s /q
xcopy %fromPath% %toPath% /s /e /y

for /r %toPath% %%i in (*) do (
	if %%~nxi == %batName% (del %%i /F) ELSE ren %%~fi %%~ni%newExtendName%
)