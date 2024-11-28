@echo off

set /p foldername="Enter the name of your folder (or type '/c' to close): "

:: Check if the user entered a cancellation command
if /i "%foldername%"=="cancel" goto :cancel
if /i "%foldername%"=="exit" goto :cancel
if /i "%foldername%"=="stop" goto :cancel
if /i "%foldername%"=="/c" goto :cancel
if /i "%foldername%"=="end" goto :cancel

:: If no cancellation command, proceed with the folder name
echo You entered: %foldername%
goto :eof

:cancel
:: Display cancellation message and pause
echo Process cancelled. No file created.
pause
