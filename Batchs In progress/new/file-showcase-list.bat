@echo off
color 07
:main
cls
echo File Listing Script
echo ====================
echo.

set /p folderpath=Enter the file/folder path (type "cancel", "exit", or "stop" to exit): 

:: Check for cancel commands
if /i "%folderpath%"=="cancel" goto :cancel
if /i "%folderpath%"=="exit" goto :cancel
if /i "%folderpath%"=="stop" goto :cancel
if /i "%folderpath%"=="end" goto :cancel
if /i "%folderpath%"=="/c" goto :cancel

:: Debug path check
echo Debug: Folder path is "%folderpath%"

:: Check if the folder exists
if not exist "%folderpath%" (
    echo The path "%folderpath%" does not exist. Please try again.
    pause
    goto :main
)

:: Navigate to the folder and list files
cd /d "%folderpath%"
echo.
echo Listing files in: %folderpath%
echo.

for /f "delims=" %%i in ('dir /b /a-d') do echo %%i
echo.

pause
goto :main

:cancel
echo Process cancelled. No action performed.
color 0c
pause
exit /b
