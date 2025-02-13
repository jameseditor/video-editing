@echo off

:: Initialize the counter
set counter=1

:main
set "foldername="
set /p foldername="Enter the base name of your folder (or type '/c' to close): "

:: Check for empty input for nothing being entered
if "%foldername%"=="" (
    echo Error: Folder name cannot be empty. Please try again.
    goto promptName
)

:: Check for special characters using findstr and regular expressions
echo %foldername% | findstr /R /C:"[!@#$%^&*()]" >nul
if %errorlevel% equ 0 (
    echo Project name contains special characters. Please use only letters and numbers.
    goto promptName
)

:: Check if the user entered a cancellation command
if /i "%foldername%"=="cancel" goto :cancel
if /i "%foldername%"=="exit" goto :cancel
if /i "%foldername%"=="stop" goto :cancel
if /i "%foldername%"=="/c" goto :cancel
if /i "%foldername%"=="end" goto :cancel

:: Replace spaces in the folder name with hyphens
set "foldername=%foldername: =-%"

:: Check if the folder already exists with the new suffix
set folderPrefix=0%counter%
set folderPrefix=%folderPrefix:~-2%

if exist "%CD%\%folderPrefix%-%foldername%" (
    echo Error: Folder "%folderPrefix%-%foldername%" already exists in the current directory.
    goto :main
)

:: Create the folder with the current prefix
md "%CD%\%folderPrefix%-%foldername%"
echo Folder "%folderPrefix%-%foldername%" created in the current directory.

:: Increment the counter
set /a counter+=1

:: Return to the folder name prompt to allow the user to add more folders
goto :main

:cancel
:: Display cancellation message with color
color 0C
echo Process cancelled. No action performed.
pause
