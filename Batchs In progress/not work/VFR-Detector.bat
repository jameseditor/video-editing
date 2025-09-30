@echo off
setlocal enabledelayedexpansion

:: Set the current folder as the base folder
set "currentFolder=%cd%"

:: Temporary file to store results
set "tempFile=%currentFolder%\vfr_check_results.txt"

:: Clear previous results file if it exists
if exist "%tempFile%" del "%tempFile%"

:: Loop through all video files in the current folder and subfolders
echo Scanning folder: "%currentFolder%"...
for /r "%currentFolder%" %%F in (*.mp4 *.mov *.mkv *.avi) do (
    echo Checking: %%F
    ffmpeg -i "%%F" -hide_banner 2>&1 | findstr /R /C:"VFR" >nul
    if !errorlevel! equ 0 (
        echo VFR detected: %%F
        echo %%F >> "%tempFile%"
    ) else (
        echo Constant Frame Rate (CFR): %%F
    )
)

:: Display summary of VFR files
if exist "%tempFile%" (
    echo ==================================================
    echo VFR files detected:
    type "%tempFile%"
    echo ==================================================
    echo Results saved in: "%tempFile%"
) else (
    echo No VFR files found in the current folder structure.
)

:: Cleanup and end
pause
