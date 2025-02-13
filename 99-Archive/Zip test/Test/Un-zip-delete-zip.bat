@echo off
setlocal
:: Set the working directory to the location of this script
cd /d "%~dp0"

:: Check if 7-Zip exists in the specified path
if not exist "C:\Program Files\7-Zip\7z.exe" (
    echo 7-Zip not found. Please make sure it is installed in "C:\Program Files\7-Zip\".
    pause
    exit /b
)

:: Check if any .zip files are present
if not exist "*.zip" (
    echo No .zip files found in the current directory.
    pause
    exit /b
)

:: Log file for errors
set LOGFILE=errors.log
echo Extraction errors will be logged to "%LOGFILE%".

:: Ask user for confirmation to delete zip files
echo Do you want to delete the original zip files after extraction? (Y/N)
set /p delete_choice=Your choice: 
if /i "%delete_choice%" neq "Y" (
    echo Skipping deletion of zip files.
    pause
    exit /b
)

:: Loop through all .zip files in the current directory
for %%f in (*.zip) do (
    echo Extracting "%%f"...
    "C:\Program Files\7-Zip\7z.exe" x "%%f" -o"%%~nf" -y
    if not errorlevel 1 (
        echo Deleting "%%f"...
        del "%%f"
    ) else (
        echo Failed to extract "%%f". Skipping deletion.
        echo Failed to extract "%%f". >> "%LOGFILE%"
    )
)

:: Change text color to green (color 0A) and show completion message
color 0A
echo Extraction completed successfully!
echo All zip files have been processed.
pause
