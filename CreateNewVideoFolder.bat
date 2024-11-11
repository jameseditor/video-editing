@echo off

:: User guidance
echo This script will help you create a folder structure for your video project.
echo You will be prompted to enter a project name.
echo If the project folder already exists, no new folders will be created.
echo Type "cancel", "exit", or "stop" to cancel at any time.
echo.

:promptName
:: Prompt for project folder name
set /p projectName=Enter the project folder name (type "cancel", "exit", or "stop" to exit): 

:: Check if the user typed any cancellation commands
if /i "%projectName%"=="cancel" (
    echo Process cancelled.
    exit /b
)
if /i "%projectName%"=="exit" (
    echo Process cancelled.
    exit /b
)
if /i "%projectName%"=="stop" (
    echo Process cancelled.
    exit /b
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

echo Folder structure created inside "%projectName%" successfully!

:: Countdown before closing
for /l %%i in (3,-1,1) do (
    echo Closing in %%i seconds...
    timeout /t 1 /nobreak >nul
)

exit