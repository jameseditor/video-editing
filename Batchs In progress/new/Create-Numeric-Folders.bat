@echo off

:: Initialize the counter
set counter=1

:main
set /p foldername="Enter the base name of your folder (or type '/c' to close): "

:: Check if the user entered a cancellation command
if /i "%foldername%"=="cancel" goto :cancel
if /i "%foldername%"=="exit" goto :cancel
if /i "%foldername%"=="stop" goto :cancel
if /i "%foldername%"=="/c" goto :cancel
if /i "%foldername%"=="end" goto :cancel

:: Replace spaces in the foldername with hyphens
set "foldername=%foldername: =-%"

:: Check if the folder already exists with the new suffix
set folderSuffix=0%counter%
set folderSuffix=%folderSuffix:~-2%

if exist "%CD%\%foldername%-%folderSuffix%" (
    echo Folder "%foldername%-%folderSuffix%" already exists in the current directory.
    goto :main
)

:: Create the folder with the current suffix
md "%CD%\%foldername%-%folderSuffix%"
echo Folder "%foldername%-%folderSuffix%" created in the current directory.

:: Increment the counter
set /a counter+=1

:: Return to the folder name prompt to allow the user to add more folders
goto :main

:cancel
:: Display cancellation message with color
color 0C
echo Process cancelled. No action performed.
pause
