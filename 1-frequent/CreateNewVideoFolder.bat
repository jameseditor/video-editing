@echo off
setlocal enabledelayedexpansion

:: Set up colors for better visibility
color 0F

:: User guidance
echo ==================================================
echo This script creates a folder structure for your video project.
echo Then saves a shortcut in active project folder.
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
call :createSubfolders "%projectName%" "01-Projects 02-Footage 03-Assets 04-Exports 05-Other"
call :createSubfolders "%projectName%\03-Assets" "01-Clips 02-Images 03-Music 04-SFX 05-GFX"
call :createSubfolders "%projectName%\02-Footage" "A-roll"
call :createSubfolders "%projectName%\04-Exports" "99-Archive"
call :createSubfolders "%projectName%\01-Projects" "Backups"

:: Sets Main folder icons
call :setFolderIcon "%projectName%\01-Projects" "D:\Personal\Assets\Folder-Icons\Colours\gray.ico"
call :setFolderIcon "%projectName%\02-Footage"    "D:\Personal\Assets\Folder-Icons\Colours\orange.ico"
call :setFolderIcon "%projectName%\03-Assets"    "D:\Personal\Assets\Folder-Icons\Colours\lemon.ico"
call :setFolderIcon "%projectName%\04-Exports"    "D:\Personal\Assets\Folder-Icons\Colours\blue.ico"
call :setFolderIcon "%projectName%\05-Other"    "D:\Personal\Assets\Folder-Icons\Colours\gray.ico"

:: Sets child folder icons
call :setFolderIcon "%projectName%\03-Assets\01-Clips"    "D:\Personal\Assets\Folder-Icons\Colours\orange.ico"
call :setFolderIcon "%projectName%\03-Assets\02-Images"    "D:\Personal\Assets\Folder-Icons\Colours\blue.ico"
call :setFolderIcon "%projectName%\03-Assets\03-Music"    "D:\Personal\Assets\Folder-Icons\Colours\violet.ico"
call :setFolderIcon "%projectName%\03-Assets\04-SFX"    "D:\Personal\Assets\Folder-Icons\Colours\green.ico"
call :setFolderIcon "%projectName%\03-Assets\05-GFX"    "D:\Personal\Assets\Folder-Icons\Colours\lemon.ico"

:setFolderIcon
set "targetFolder=%~1"
set "iconPath=%~2"

(
    echo [.ShellClassInfo]
    echo IconResource=%iconPath%,0
    echo IconFile=%iconPath%
    echo IconIndex=0
) > "%targetFolder%\desktop.ini"

:: Set desktop.ini as system and hidden, set folder attribute to read-only so icon shows
attrib +s +h "%targetFolder%\desktop.ini"
attrib +r "%targetFolder%"

echo Icon set for %targetFolder%


:: Copy script if it exists
set "sourceScript=D:\Personal\video-editing-scripts\1-frequent\un-zip-extract-here.bat"
set "destinationFolder=%projectName%\02-Footage"

if not exist "%destinationFolder%" md "%destinationFolder%"
if exist "%sourceScript%" (
    copy "%sourceScript%" "%destinationFolder%" && echo Script copied to B-roll.
) else (
    echo Script not found: %sourceScript%
)
:: Create Google Docs setup guide shortcut inside project folder
set "docLink=https://docs.google.com/document/d/1eNSp_-wK8olFpx0R9_ocKgWxQdRfmm5I6vEsxHtKdkU/edit?tab=t.wsuxjw3p5jdm"
set "shortcutFile=%projectName%\Setup-Guide.url"

(
    echo [InternetShortcut]
    echo URL=%docLink%
    echo IconFile=https://ssl.gstatic.com/docs/doclist/images/infinite_arrow_favicon_5.ico
    echo IconIndex=0
) > "%shortcutFile%"

echo Google Docs shortcut created: %shortcutFile%


:: Create shortcut
call :createShortcut "%projectName%"

:: create readme.md
call :createReadme "%projectName%"

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
echo.
echo Created:
echo.
for %%F in (%~1) do (
    md "%parentFolder%\%%F" && echo: %parentFolder%\%%F
)
exit /b


:: Copy readme if it exists

:createReadme
set "readme=D:\Personal\video-editing-scripts\video-folder-assets\README.md"
set "destinationFolderReadme=%projectName%"

if not exist "%destinationFolderReadme%" md "%destinationFolderReadme%"
if exist "%readme%" (
    copy "%readme%" "%destinationFolderReadme%" && echo Readme copyed project.
) else (
    echo Readme not found: %readme%
)

:createShortcut
set "targetFolder=%cd%\%~1"
set "shortcutPath=D:\Videos\1-Active-project\%~1.lnk"

:: Ensure unique shortcut name
:checkShortcut
set "count=1"
if exist "%shortcutPath%" (
    set "shortcutPath=D:\Videos\1-Active-project\%~1-%count%.lnk"
    set /a count+=1
    exit /b
)

:: Create shortcut using PowerShell
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutPath%'); $Shortcut.TargetPath = '%targetFolder%'; $Shortcut.Save()"

if exist "%shortcutPath%" (
    echo Shortcut created: %shortcutPath%
) else (
    echo Failed to create the shortcut.
)
exit /b