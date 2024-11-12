@echo off
setlocal

:: Check if 7-Zip exists in the specified path
if not exist "C:\Program Files\7-Zip\7z.exe" (
    echo 7-Zip not found. Please make sure it is installed in "C:\Program Files\7-Zip\".
    pause
    exit /b
)

:: Loop through each .zip file in the current directory
for %%X in (*.zip) do (
    echo Extracting "%%X"...
    "C:\Program Files\7-Zip\7z.exe" x "%%X" -o"%%~nX" -y
    if %errorlevel% equ 0 (
        echo Successfully extracted "%%X" to folder "%%~nX".
    ) else (
        echo Error extracting "%%X".
    )
)

echo All zip files have been processed.
pause
endlocal
