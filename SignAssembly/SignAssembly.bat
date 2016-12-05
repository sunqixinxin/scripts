@Echo off

set ildasmPath=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin
set ilasmPath=C:\Windows\Microsoft.NET\Framework\v2.0.50727

set currentPath=%~dp0
set assamblyPath=%1
set assamblyName=%2
set assamblyType=%3
set keyFile=%4

del %currentPath%Signed\%assamblyName%.* /F
"%ildasmPath%\ildasm.exe" "%assamblyPath%\%assamblyName%.%assamblyType%" /out:"%currentPath%Signed\%assamblyName%.il"
"%ilasmPath%\ilasm.exe" "%currentPath%Signed\%assamblyName%.il" /%assamblyType% /key="%currentPath%%keyFile%" /output="%currentPath%Signed\%assamblyName%.%assamblyType%"

pause /s