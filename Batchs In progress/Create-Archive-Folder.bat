@echo off

:: Set the working directory to the location of this script
cd /d "%~dp0"

:: Ask user for custom folder name
set /p "FolderName=Enter the folder name or hit ENTER to Create Archive: "

:: If no input, use default "Archive"
if "%FolderName%"=="" set "FolderName=Archive"

:: Check if the folder already exists
if exist "%FolderName%" (
    echo Folder "%FolderName%" already exists.
    echo No action was taken.
    goto :exitScript
)

:: Create the folder
md "%FolderName%"

echo Folder structure created inside "%FolderName%" successfully!

:: Countdown before closing
for /l %%i in (3,-1,1) do (
    echo Closing in %%i seconds...
    timeout /t 1 /nobreak >nul
)

:exitScript
exit
