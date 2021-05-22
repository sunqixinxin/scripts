@echo off

set batName=%~nx0

:: rename file extension name, * -> all
set ext=mp3
:: old -> new
set old={www.Ysx8.com}
set new=

for /f "delims=" %%i in ('dir /b /a-d "*.%ext%"' ) do ( 
	if not "%%~nxi"=="%batName%" (
		set str1=%%i 
		setlocal EnableDelayedExpansion
		set "str1=!str1:%old%=%new%!"
		ren "%%i" "!str1!"
		endlocal
	)
)
pause