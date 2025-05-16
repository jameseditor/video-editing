@echo off
setlocal EnableDelayedExpansion

:: Define paths
set "mediainfoPath=C:\Program Files\MediaInfo\MediaInfo.exe"
set "currentFolder=%CD%"

:: Check if MediaInfo exists
if not exist "!mediainfoPath!" (
    echo [ERROR] MediaInfo.exe not found at "!mediainfoPath!"
    pause
    exit /b
)

:: Inform the user to use Alt + F4 to close each MediaInfo tab
echo.
echo [INFO] After each MediaInfo tab opens, please use ALT + F4 to close it and move to the next tab.
echo [INFO] Note: This script is not fully completed and does not correctly display all values yet.
echo.
echo ==================================================

:: Loop through all video files in the current folder and subfolders
echo Scanning folder: "%currentFolder%" and its subfolders...
echo ==================================================

for /r "%currentFolder%" %%F in (*.mp4 *.mov *.mkv *.avi) do (
    echo Checking: %%F

    :: Run MediaInfo and capture the FrameRate Mode
    for /f "delims=" %%A in ('""!mediainfoPath!" --Inform="Video;%%FrameRate_Mode%%" "%%~F""') do (
        set "frameRateMode=%%A"
    )

    :: Display result
    echo FrameRate Mode for this file is: !frameRateMode!
    echo.
    
    :: Check if VFR (Variable Frame Rate)
    if /I "!frameRateMode!"=="VFR" (
        echo [WARNING] Variable Frame Rate detected: %%F
    )
)

echo ==================================================
echo Scan complete.

pause
