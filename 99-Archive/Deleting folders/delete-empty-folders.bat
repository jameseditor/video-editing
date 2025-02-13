@echo off
setlocal enabledelayedexpansion

:: Get the current directory
set "currentDir=%cd%"

echo Delete empty folders in: %currentDir% 
echo.
:: Prompt to press Enter to start or type 'cancel' to exit
echo Press Enter to start or type 'cancel' to cancel.
set /p folderCleanupResponse=""

:: Check if the user typed any cancellation commands
if /i "%folderCleanupResponse%"=="cancel" (
    echo Process cancelled.
    exit /b
)

:: Loop through all folders, starting from the deepest
for /f "tokens=*" %%F in ('dir /ad /b /s "%currentDir%" 2^>nul') do (
    :: Check if the folder is empty
    dir "%%F" /a /b >nul 2>&1
    if not errorlevel 1 (
        for /f %%I in ('dir "%%F" /a /b') do set "item=%%I"
        if "!item!"=="" (
            echo Deleting empty folder: %%F
            rmdir "%%F" >nul
        )
    )
)

echo Empty folder deletion process complete.
pause
exit /b
