@echo off
setlocal enabledelayedexpansion

:: Set up colors for better visibility
color 0F

:: User guidance
echo ==================================================
echo This script will create a folder structure for your video project.
echo ==================================================
echo.
echo Commands:
echo [Enter] - Create folders
echo [C] - Cancel
echo [H] - Help
echo.

:mainMenu
:: Prompt for project name
set /p projectName=Enter project folder name ("H" for help): 

:: Handle cancel/help requests
if /i "%projectName%"=="c" exit /b
if /i "%projectName%"=="h" goto :help

:: Validate project name
call :validateProjectName "%projectName%" || goto :mainMenu

:: Replace spaces with hyphens
set "projectName=%projectName: =-%"

:: Create project folder and subdirectories
md "%projectName%" && echo Created: %projectName%
call :createSubfolders "%projectName%" "Assets Footage Timelines"
call :createSubfolders "%projectName%\Assets" "1-Clips 2-Images 3-Music-Extra 4-SFX-Extra 5-Other"
call :createSubfolders "%projectName%\Footage" "A-roll B-roll Renders"

:: Copy script if it exists
set "sourceScript=D:\Personal\video-editing-scripts\1-frequent\un-zip-extract-here.bat"
set "destinationFolder=%projectName%\Footage\B-roll"

if not exist "%destinationFolder%" md "%destinationFolder%"
if exist "%sourceScript%" (
    copy "%sourceScript%" "%destinationFolder%" && echo Script copied to B-roll.
) else (
    echo Script not found: %sourceScript%
)

:: Create shortcut
call :createShortcut "%projectName%"

echo Folder structure created inside "%projectName%" successfully!
color 0A
exit /b

:help
echo ==================================================
echo HELP
echo ==================================================
echo - Project Name: Use letters, numbers, spaces, or hyphens.
echo - Invalid Characters: ^<^>^:"/^\\|?*
echo - Folders Created: Assets, Footage, Timelines, etc.
echo - Cancel: Type "C" to cancel.
echo ==================================================
pause
cls
goto :mainMenu

:validateProjectName
set "name=%~1"

:: Check for invalid characters, empty names, or existing folders
echo %name% | findstr /R "[!@#$%^&*()]" >nul && (
    echo Invalid project name. Avoid special characters.
    exit /b 1
)

if "%name%"=="" (
    echo Project name cannot be empty.
    exit /b 1
)

if exist "%name%" (
    echo The folder "%name%" already exists.
    exit /b 1
)

exit /b 0

:createSubfolders
set "parentFolder=%~1"
shift
for %%F in (%~1) do (
    md "%parentFolder%\%%F" && echo Created: %parentFolder%\%%F
)
exit /b

:createShortcut
set "targetFolder=%cd%\%~1"
set "shortcutPath=D:\Videos\1-Active-project\%~1.lnk"

:: Ensure unique shortcut name
set "count=1"
:checkShortcut
if exist "%shortcutPath%" (
    set "shortcutPath=D:\Videos\1-Active-project\%~1-%count%.lnk"
    set /a count+=1
    goto checkShortcut
)

:: Create shortcut using PowerShell
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutPath%'); $Shortcut.TargetPath = '%targetFolder%'; $Shortcut.Save()"

if exist "%shortcutPath%" (
    echo Shortcut created: %shortcutPath%
) else (
    echo Failed to create the shortcut.
)

exit /b
