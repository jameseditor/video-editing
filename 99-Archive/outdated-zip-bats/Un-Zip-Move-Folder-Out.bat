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

:: Ask the user if they want to delete the zip files after extraction
set /p delete_zip="Do you want to delete the zip files after extraction? (Y/N): "
set delete_zip=%delete_zip:~0,1%
if /i "%delete_zip%" neq "Y" if /i "%delete_zip%" neq "N" (
    echo Invalid input, please enter Y or N.
    pause
    exit /b
)

:: Loop through each .zip file in the current directory
for %%X in (*.zip) do (
    echo Extracting "%%X"...
    "C:\Program Files\7-Zip\7z.exe" x "%%X" -o"%%~nX" -y
    if not errorlevel 1 (
        echo Successfully extracted "%%X" to folder "%%~nX".

        :: Move all subfolders from the extracted folder to the parent directory
        for /d %%F in ("%%~nX\*") do (
            echo Moving "%%F" to the parent directory...
            move "%%F" .
            if not errorlevel 1 (
                echo Successfully moved "%%F" to the parent directory.
            ) else (
                echo Failed to move "%%F".
            )
        )

        :: If the user wants to delete the zip file
        if /i "%delete_zip%"=="Y" (
            echo Deleting "%%X"...
            del /f /q "%%X"
            if exist "%%X" (
                echo Failed to delete "%%X".
            ) else (
                echo Deleted "%%X".
            )

            :: Delete the extracted folder (%%~nX) after moving the subfolder
            echo Deleting extracted folder "%%~nX"...
            rd /s /q "%%~nX"
            if exist "%%~nX" (
                echo Failed to delete "%%~nX".
            ) else (
                echo Deleted "%%~nX".
            )
        )
    ) else (
        echo Error extracting "%%X".
    )
)

color 0A
echo All zip files have been processed.
pause
endlocal
