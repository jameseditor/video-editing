@echo off
:promptName
set /p filename="Enter the name of your text file (or type '/c' to close): "

:: Call the cancelCheck.bat to check for cancellation commands
call "D:\video-editing-scripts\Batch\CancelCheck.bat" "%filename%"

:: If CancelCheck.bat exits with errorlevel 1, cancel the process and exit the script
if errorlevel 1 (
    echo Process cancelled. No file will be created.
    exit /b
)

:: Check if the user entered an empty name
if "%filename%"=="" (
    echo You must enter a valid file name.
    goto promptName
)

:: Check if the file already exists
if exist "%filename%.txt" (
    echo The file "%filename%.txt" already exists.
    goto promptName
)

:: Create the new text file
echo This is your new text file > "%filename%.txt"
echo File "%filename%.txt" has been created.

:: Ask if the user wants to move the file to the Archive folder
set /p moveFile="Do you want to move the file to D:\video-editing-scripts\Archive? (Y/N): "

:: If the user types 'Y' or 'y', move the file
if /i "%moveFile%"=="Y" (
    move "%filename%.txt" "D:\video-editing-scripts\Archive"
    echo The file has been moved to D:\video-editing-scripts\Archive.
) else (
    echo The file was not moved.
)