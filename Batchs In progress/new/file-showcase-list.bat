@echo off

:: Function to check for cancellation commands
call :checkCancel

:: Example of other script functionality

set /p folderpath=Enter the file/folder path (type "cancel", "exit", or "stop" to exit): 


cd folderpath











:: Placeholder for the rest of the script
goto :eof

:: Cancel check subroutine
:checkCancel
set /p userInput=Enter a command:
if /i "%userInput%"=="cancel" goto :cancel
if /i "%userInput%"=="exit" goto :cancel
if /i "%userInput%"=="stop" goto :cancel
if /i "%userInput%"=="end" goto :cancel
if /i "%userInput%"=="/c" goto :cancel
goto :eof

:cancel
echo Process cancelled. No action performed.
colour 0c
pause
exit /b
