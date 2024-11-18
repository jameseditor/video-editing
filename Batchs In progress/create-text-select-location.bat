@echo off
:: Set the base path to the directory where this batch file is located
set "basePath=%~dp0"

:promptName
set /p filename="Enter the name of your text file (or type '/c' to close): "

:: Check for cancellation commands directly in this script
if /i "%filename%"=="cancel" (
    echo Process cancelled. No file will be created.
    exit /b
)
if /i "%filename%"=="exit" (
    echo Process cancelled. No file will be created.
    exit /b
)
if /i "%filename%"=="stop" (
    echo Process cancelled. No file will be created.
    exit /b
)
if /i "%filename%"=="/c" (
    echo Process cancelled. No file will be created.
    exit /b
)
if /i "%filename%"=="end" (
    echo Process cancelled. No file will be created.
    exit /b
)

:: Check if the user entered an empty name
if "%filename%"=="" (
    echo You must enter a valid file name.
    goto promptName
)

:: Check if the file already exists
if exist "%basePath%%filename%.txt" (
    echo The file "%filename%.txt" already exists in "%basePath%".
    goto promptName
)

:: Create the new text file in the same location as this batch file
echo This is your new text file > "%basePath%%filename%.txt"
echo File "%filename%.txt" has been created in "%basePath%".

:: Ask if the user wants to move the file to the Archive folder
set /p moveFile="Move file to %basePath%Archive? (Y/N): "

:: If the user types 'Y' or 'y', move the file
if /i "%moveFile%"=="Y" (
    :: Ensure the Archive folder exists
    if not exist "%basePath%Archive" mkdir "%basePath%Archive"
    move "%basePath%%filename%.txt" "%basePath%Archive"
    echo The file has been moved to %basePath%Archive.
) else (
    echo The file was not moved.
)
