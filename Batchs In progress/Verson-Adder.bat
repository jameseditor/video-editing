@echo off
setlocal enabledelayedexpansion

:: Prompt user to choose a version number
echo Please enter the version number to append (e.g., 1, 2, 3, etc.):
set /p version=Version number: 

:: Validate user input (ensure it’s not empty)
if "%version%"=="" (
    echo No version number entered. Exiting...
    pause
    exit /b
)

:: Get the name of the batch file
set "batchfile=%~nx0"

:: Loop through all files in the current directory
for %%f in (*) do (
    REM Skip the batch file
    if /i "%%f" neq "%batchfile%" (
        REM Extract file name and extension
        set "filename=%%~nf"
        set "extension=%%~xf"

        REM Rename the file with the chosen version number appended
        ren "%%f" "%%~nf-v%version%%%~xf"
    ) else (
        echo Skipping the batch file "%%f".
    )
)

echo Files have been renamed with '-v%version%' appended, except the batch file.
pause
