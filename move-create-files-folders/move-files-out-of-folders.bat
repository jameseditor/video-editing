@echo off
setlocal enabledelayedexpansion

:: Log file location (appending to existing log file)
set "logFile=move_log.txt"

:: Get the current directory
set "currentDir=%cd%"

:: Prepare the log file, appending if the file exists
echo.
echo Undo Log - Moved Files >> "%logFile%"
echo Starting the file move process...
echo.

:: Loop through all folders
for /D %%F in (*) do (
    echo Processing folder: %%F
    echo.
    for %%G in ("%%F\*.*") do (
        :: Check if the file exists before moving
        if exist "%%G" (
            echo Moving file: %%G
            echo.
            move "%%G" "%currentDir%" >nul 2>&1
            if !errorlevel! == 0 (
                echo MOVE "%currentDir%\%%~nxG" "%%F\" >> "%logFile%"
                echo Successfully moved: %%G
                echo.
            ) else (
                echo Error moving: %%G >> "%logFile%"
                echo Failed to move: %%G
                echo.
            )
        )
    )
)

echo.
echo All files have been moved to: %currentDir%
echo Log of moved files saved to: %logFile%
echo.

:: Ask the user if they want to undo the operation
set /p "undo=Would you like to undo this operation? (y/n): "

if /i "!undo!"=="y" (
    echo.
    echo Undoing the last move operation...
    echo.
    for /f "tokens=*" %%A in (%logFile%) do (
        :: Reverse the move command in the log file (moving files back)
        if not "%%A"=="Undo Log - Moved Files" (
            call %%A
        )
    )
    echo.
    echo All files have been restored to their original folders.
    del "%logFile%"
    echo Undo completed. The log file has been deleted.
    echo.
) else (
    echo.
    echo Operation complete. No undo performed.
    echo.
)

pause
exit /b











