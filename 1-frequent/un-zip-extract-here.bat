@echo off
setlocal enabledelayedexpansion

:: Script Introduction
echo ==================================================
echo This script extracts .zip files in the current directory 
echo and moves them to the Recycle Bin.
echo h for more help...
echo ==================================================
echo.

:: Set working directory to script location
cd /d "%~dp0"

:: User Input Prompt
:prompt
set /p user_input="Do you want to extract the files? (y/c/h): "
if /i "%user_input%"=="y" (
    echo Proceeding with extraction...
) else if /i "%user_input%"=="c" (
    echo Extraction canceled. Exiting...
    exit /b
) else if /i "%user_input%"=="h" (
    goto :help
) else (
    echo Invalid input. Please type y, c, or h.
    goto :prompt
)

:: Check for .zip files in the directory
if not exist "*.zip" (
    echo No .zip files found in the current directory. Exiting...
    pause
    exit /b
)

:: Check for 7-Zip installation
if not exist "C:\Program Files\7-Zip\7z.exe" (
    echo 7-Zip not found. Please install it in "C:\Program Files\7-Zip\".
    pause
    exit /b
)

:: Extract .zip Files
echo Extracting .zip files...
for %%Z in (*.zip) do (
    echo Processing "%%Z"...
    "C:\Program Files\7-Zip\7z.exe" x "%%Z" -o. -y
    if !errorlevel! equ 0 (
        echo Successfully extracted: "%%Z".
    ) else (
        echo Error extracting: "%%Z".
    )
)

:: Move .zip Files to the Recycle Bin using Shell.Application
echo Moving .zip files to the Recycle Bin...
for %%Z in (*.zip) do (
    powershell -Command "$shell = New-Object -ComObject Shell.Application; $file = $shell.Namespace('%%~dpZ'); $fileItem = $file.ParseName('%%~nxZ'); $fileItem.InvokeVerb('delete')"
    if !errorlevel! equ 0 (
        echo Moved "%%Z" to the Recycle Bin.
    ) else (
        echo Failed to move "%%Z" to the Recycle Bin.
    )
)

echo Process complete. All zip files have been processed.
pause
exit /b

:: Help Section
:help
cls
echo.
echo ===================== HELP =======================
echo This script extracts .zip files in the current directory 
echo using the 7-zip Extract here function
echo and moves them to the Recycle Bin.
echo.
echo - y: Extract files and move them to the Recycle Bin.
echo - c: Cancel the process and exit the script.
echo - h: Display this help message.
echo ==================================================
pause
cls
goto :prompt
