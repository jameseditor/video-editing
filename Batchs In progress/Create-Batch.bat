@echo off
setlocal enabledelayedexpansion

:: Prompt for the batch file name
:promptName
set /p "filename=Enter the name for the new batch file (without extension): "

:: Check if the user entered an empty name
if "%filename%"=="" (
    echo You must enter a valid project name.
    goto promptName
)

:: Check for cancellation commands
call :checkCancel

:: Replace spaces in the filename with hyphens
set "filename=!filename: =-!"

:: Create the batch file name with .bat extension
set "new_file=!filename!.bat"

:: Check if the project file already exists
if exist "%new_file%" (
    echo The file "%new_file%" already exists.
    goto promptName
)

:: Create an empty batch file
echo. > "%new_file%"

:: Notify the user of the file creation
echo New batch file created: %new_file%

:: Open the new batch file in Visual Studio Code
"C:\Users\James Slone\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%new_file%"

exit /b

:: Cancel check subroutine
:checkCancel
:: Check if the user entered a cancellation command
if /i "%filename%"=="cancel" goto :cancel
if /i "%filename%"=="exit" goto :cancel
if /i "%filename%"=="stop" goto :cancel
if /i "%filename%"=="end" goto :cancel
goto :eof

:cancel
:: Display cancellation message
echo Process cancelled. No action performed.
color 0C
pause
exit /b
