@ECHO OFF

set currentPath=%~dp0
set filePath=%1
set appPath=%2

echo file path: %filePath%
echo app path: %appPath%

setlocal enabledelayedexpansion
For /f "tokens=1* delims=:" %%i in ('Type %filePath%^|Findstr /n ".*"') do ( 
	set dllPath=%appPath%\%%j
    echo Start to restore: !dllPath!
	REM say we need to instore for test.dll, after instrument
	REM there will four file: test.dll, test.dll.orig, test.pdb, test.instr.pdb
	REM test.dll and test.instr.pdb are generaged newly, test.dll.orig is backup of original dll.
	REM we need to delete test.dll and test.instr.pdb, rename test.dll.orig to test.dll
	
	REM del test.dll or test.exe
	echo del /q !dllPath!
	del /q !dllPath!
	
	REM del test.instr.pdb
	set instruPdbPath=!dllPath:.dll=.instr.pdb!
	set instruPdbPath=!instruPdbPath:.exe=.instr.pdb!
	echo del /q !instruPdbPath!
	del /q !instruPdbPath!
	
	:: rename test.dll.orig to test.dll
	echo copy /y !dllPath!.orig !dllPath!
	copy /y !dllPath!.orig !dllPath!
	echo del /q !dllPath!.orig
	del /q !dllPath!.orig
)