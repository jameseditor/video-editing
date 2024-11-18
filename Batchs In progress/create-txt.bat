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