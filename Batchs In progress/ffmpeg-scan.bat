@echo off
setlocal enabledelayedexpansion

:: Input file (change this or drag-drop onto the script)
set "INPUT=%~1"

if "%INPUT%"=="" (
    echo Usage: drag and drop a video file onto this script OR edit INPUT in the script.
    pause
    exit /b
)

:: Run FFmpeg VFR detection
for /f "tokens=*" %%A in ('ffmpeg -i "%INPUT%" -vf vfrdet -an -f null - 2^>^&1 ^| findstr "VFR:"') do (
    set "LINE=%%A"
)

echo Result: !LINE!

:: Check if it's CFR or VFR
echo !LINE! | findstr "VFR:0.000000" >nul
if %errorlevel%==0 (
    echo ✅ File is Constant Frame Rate (CFR).
) else (
    echo ⚠️ File is Variable Frame Rate (VFR).
)

pause
