@echo off
setlocal enabledelayedexpansion

:: Prompt user for file path
set /p "videopath=Enter the full path to your video file: "

:: Run ffmpeg vfr detection
ffmpeg -i "%videopath%" -vf vfrdet -an -f null - 2>&1 | findstr "VFR:"

echo.
echo Check the VFR value above:
echo - VFR close to 0.0 = Constant Frame Rate (CFR)
echo - Higher values = Variable Frame Rate (VFR)
echo.

pause
