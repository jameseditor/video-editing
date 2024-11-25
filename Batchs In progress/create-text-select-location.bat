@echo off
setlocal enabledelayedexpansion

:: Ask the user to provide a filename for tracking (optional, can be ignored for functionality)
set /p "filename=Enter a filename or command: "

:: Check for cancellation commands directly in this script
if /i "%filename%"=="cancel" (
    echo Process cancelled. No action will be performed.
    exit /b
)
if /i "%filename%"=="exit" (
    echo Process cancelled. No action will be performed.
    exit /b
)
if /i "%filename%"=="stop" (
    echo Process cancelled. No action will be performed.
    exit /b
)
if /i "%filename%"=="/c" (
    echo Process cancelled. No action will be performed.
    exit /b
)
if /i "%filename%"=="end" (
    echo Process cancelled. No action will be performed.
    exit /b
)

:: Get the current directory
set "currentDir=%cd%"

:: Loop through all the folders
for /D %%F in (*) do (
    echo Processing folder: %%F
    :: Move all files from the folder to the current directory
    move "%%F\*.*" "%currentDir%" >nul 2>&1
)

echo All files have been moved to: %currentDir%
pause
