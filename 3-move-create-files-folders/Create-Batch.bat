@echo off
setlocal enabledelayedexpansion

:: Set the path to Visual Studio Code
set "vscodePath=C:\Users\James Slone\AppData\Local\Programs\Microsoft VS Code\Code.exe"

:: Prompt for the batch file name
:promptName
set /p "filename=Enter the name for the new batch file (without extension): "

:: Check for cancellation commands and empty input
if "%filename%"=="" (
    echo You must enter a valid project name.
    goto promptName
)

:: Check for cancellation commands
call :checkCancel "%filename%"

:: Replace spaces in the filename with hyphens and add .bat extension
set "filename=!filename: =-!"
set "new_file=!filename!.bat"

:: Check if the file already exists
if exist "%new_file%" (
    echo The file "%new_file%" already exists.
    goto promptName
)

:: Create the new batch file and add the template content
(
    echo @echo off
    echo.
    echo :: Function to check for cancellation commands
    echo call :checkCancel
    echo.
    echo :: Example of other script functionality
    echo echo Doing some work...
    echo.
    echo :: ===================================
    echo :: User-defined code section starts here
    echo :: Add your custom script functionality below this line
    echo :: ===================================
    echo.
    echo :: Placeholder for the rest of the script
    echo goto :eof
    echo.
    echo :: Cancel check subroutine
    echo :checkCancel
    echo set /p userInput=Enter a command:
    echo if /i "%%userInput%%"=="cancel" goto :cancel
    echo if /i "%%userInput%%"=="exit" goto :cancel
    echo if /i "%%userInput%%"=="stop" goto :cancel
    echo if /i "%%userInput%%"=="end" goto :cancel
    echo if /i "%%userInput%%"=="/c" goto :cancel
    echo goto :eof
    echo.
    echo :cancel
    echo echo Process cancelled. No action performed.
    echo colour 0c
    echo pause
    echo exit /b
) > "%new_file%"

echo New batch file created: %new_file%

:: Check if Visual Studio Code exists and open the file
if exist "%vscodePath%" (
    "%vscodePath%" "%new_file%"
) else (
    echo Visual Studio Code is not installed or the path is incorrect.
    pause
)

exit /b

:cancel
:: Display cancellation message
echo Process cancelled. No action performed.
color 0C
pause
exit /b

:: Function to check for cancellation commands
:checkCancel
:: Check if the user entered a cancellation command
setlocal
set "input=%~1"
if /i "%input%"=="cancel" exit /b
if /i "%input%"=="exit" exit /b
if /i "%input%"=="stop" exit /b
if /i "%input%"=="end" exit /b
if /i "%input%"=="/c" exit /b
exit /b
