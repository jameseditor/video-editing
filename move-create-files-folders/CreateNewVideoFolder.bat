@echo off

:: User guidance
echo This script will create a folder structure for your video project.
echo.

:promptName
:: Prompt for project folder name
set /p projectName=Enter the project folder name (type "cancel", "exit", or "stop" to exit): 

:: Check if the user entered a cancellation command
if /i "%projectName%"=="cancel" goto :cancel
if /i "%projectName%"=="exit" goto :cancel
if /i "%projectName%"=="stop" goto :cancel
if /i "%projectName%"=="/c" goto :cancel
if /i "%projectName%"=="end" goto :cancel

:: Check for special characters using findstr and regular expressions
echo %projectName% | findstr /R /C:"[!@#$%^&*()]" >nul
if %errorlevel% equ 0 (
    echo Project name contains special characters. Please use only letters and numbers.
    goto promptName
)

:: Check if the project folder already exists
if exist "%projectName%" (
    echo The folder "%projectName%" already exists.
    goto promptName
)

:: Check if the user entered an empty name
if "%projectName%"=="" (
    echo You must enter a valid project name.
    goto promptName
)

:: Create the main project folder
md "%projectName%"
echo Created folder: %projectName%

:: Create subfolders inside the project folder
md "%projectName%\Assets"
md "%projectName%\Footage"
md "%projectName%\Timelines"

:: Subfolders in Assets
md "%projectName%\Assets\1 - Clips"
md "%projectName%\Assets\2 - Images"
md "%projectName%\Assets\3 - Music Extra"
md "%projectName%\Assets\4 - SFX Extra"
md "%projectName%\Assets\5 - Other"

:: Subfolders in Footage
md "%projectName%\Footage\A-roll"
md "%projectName%\Footage\A-roll\Audio"
md "%projectName%\Footage\B-roll"
md "%projectName%\Footage\Renders"

:: Success message with color
echo Folder structure created inside "%projectName%" successfully!
color 0A

goto :eof

:cancel
:: Display cancellation message with color
echo Process cancelled. No action performed.
color 0C
pause
exit /b
