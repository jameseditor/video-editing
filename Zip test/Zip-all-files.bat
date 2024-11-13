@echo off
setlocal

:: Prompt for the folder to zip
set /p folder="Enter the full path of the folder you want to zip: "

:: Check if the folder exists
if not exist "%folder%" (
    echo The specified folder does not exist.
    exit /b
)

:: Prompt for the output zip file name
set /p zipName="Enter the name for the zip file (without extension): "

:: Check if the output zip file already exists
if exist "%folder%\%zipName%.zip" (
    echo The zip file "%zipName%.zip" already exists.
    exit /b
)

:: Zip the folder contents using PowerShell
echo Zipping the files in "%folder%" into "%zipName%.zip"...
powershell -command "Compress-Archive -Path '%folder%\*' -DestinationPath '%folder%\%zipName%.zip'"

:: Check if the zip operation was successful
if exist "%folder%\%zipName%.zip" (
    echo Successfully created the zip file: "%zipName%.zip"
) else (
    echo Failed to create the zip file.
)

pause
endlocal
