@echo off
setlocal enabledelayedexpansion

:: Ask the user to provide a filename for tracking (optional, can be ignored for functionality)
set /p "filename=Enter a filename or command: "

:: Check if the user entered a cancellation command
if /i "%filename%"=="cancel" goto :cancel
if /i "%filename%"=="exit" goto :cancel
if /i "%filename%"=="stop" goto :cancel
if /i "%filename%"=="/c" goto :cancel
if /i "%filename%"=="end" goto :cancel

:: Proceed with the rest of the script if no cancellation command entered
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
goto :eof

:cancel
:: Display cancellation message
echo Process cancelled. No action performed.
pause
exit /b
