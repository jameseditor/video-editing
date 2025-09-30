@ECHO OFF
FOR %%i IN (*.*) DO (
ECHO "%%i" | FIND /I "zip.bat" 1＞NUL) || (
"c:\Program Files\7-Zip\7z.exe" a -tzip "%%~ni.zip" "%%i"
if %ERRORLEVEL% == 0 del "%%i"
)
)