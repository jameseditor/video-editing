@echo off
setlocal enabledelayedexpansion

:: Get the current directory
set "currentDir=%cd%"

echo Delete empty folders in: %currentDir% 
echo.
:: Prompt to press Enter to start
echo Press Enter to start or type 'cancel', 'exit', or 'stop' to cancel.
set /p projectName=""

:: Check if the user typed any cancellation commands
if /i "%projectName%"=="cancel" (
    echo Process cancelled.
    exit /b
)
if /i "%projectName%"=="exit" (
    echo Process cancelled.
    exit /b
)
if /i "%projectName%"=="stop" (
    echo Process cancelled.
    exit /b
)

:: Loop through all folders and subfolders
for /f "delims=" %%F in ('dir "%currentDir%" /ad /b /s') do (
    :: Check if the folder is empty by attempting to list files inside it
    dir "%%F" >nul 2>&1
    if errorlevel 1 (
        echo Deleting empty folder: %%F
        rmdir "%%F" >nul
    )
)

echo Empty folder deletion process complete.

pause
exit /b