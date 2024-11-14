@echo off
setlocal

:promptName
:: Prompt the user for the new batch file name
set /p "filename=Enter the name for the new batch file (without extension): "

:: Check if the user entered an empty name
if "%filename%"=="" (
    echo You must enter a valid project name.
    goto promptName
)

:: Check if the user typed any cancellation commands
if /i "%filename%"=="cancel" (
    echo Process cancelled.
    exit /b
)
if /i "%filename%"=="exit" (
    echo Process cancelled.
    exit /b
)
if /i "%filename%"=="stop" (
    echo Process cancelled.
    exit /b
)

if /i "%filename%"=="end" (
    echo Process cancelled.
    exit /b
)

:: Check if the project folder already exists
if exist "%filename%" (
    echo The folder or file "%filename%" already exists.
    goto promptName
)

:: Add .bat extension to the filename
set "new_file=%filename%.bat"

:: Create an empty batch file
echo. > "%new_file%"

:: Notify the user of the file creation
echo New batch file created: %new_file%
pause