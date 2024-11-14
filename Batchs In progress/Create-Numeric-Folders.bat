@echo off
setlocal enabledelayedexpansion

:: Initialize variables
set "count=1"
set "folders="

:inputLoop
:: Prompt user for folder name
set /p "folderName=Enter folder name (or type 'create' to start, 'cancel' to exit): "

:: Check if user typed 'create' to finish input
if /i "%folderName%"=="create" goto createFolders
if /i "%folderName%"=="cancel" goto exitScript
if /i "%folderName%"=="exit" goto exitScript

:: Add folder name to list, properly handling spaces, and increment count
set "folders=!folders! \"!count!-!folderName!\""
set /a count+=1
goto inputLoop

:createFolders
echo.
echo Creating folders...
:: Countdown
for /l %%i in (3,-1,1) do (
    echo %%i
    timeout /t 1 >nul
)

:: Create folders in batch file directory
for %%f in (%folders%) do (
    mkdir %%f
    echo Created folder: %%f
)

echo.
echo Folder structure created successfully.
goto :eof

:exitScript
echo Script canceled or exited without creating folders.
goto :eof
