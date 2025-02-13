@echo off
setlocal

:: Set the path to the "Cats" folder inside the "Dogs" folder
set sourceFolder=Dogs\Cats

:: Check if the "Dogs\Cats" folder exists
if not exist "%sourceFolder%" (
    echo Folder "%sourceFolder%" does not exist.
    pause
    exit /b
)

:: Move the "Cats" folder from "Dogs" to the current directory
echo Moving "%sourceFolder%" to the parent directory...
move "%sourceFolder%" .

:: Check if the move was successful
if %errorlevel% equ 0 (
    echo Successfully moved the "Cats" folder out of "Dogs".
    rd /s /q "Dogs"
) else (
    echo Failed to move the "Cats" folder.
)

pause
endlocal
