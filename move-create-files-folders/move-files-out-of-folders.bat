@echo off
setlocal enabledelayedexpansion

:: Log file location (appending to existing log file)
set "logFile=move_log.txt"

:: Get the current directory
set "currentDir=%cd%"

:: Prepare the log file, appending if the file exists
echo Undo Log - Moved Files >> "%logFile%"
echo Starting the file move process...

:: Loop through all folders
for /D %%F in (*) do (
    echo Processing folder: %%F
    for %%G in ("%%F\*.*") do (
        :: Check if the file exists before moving
        if exist "%%G" (
            echo Moving file: %%G
            move "%%G" "%currentDir%" >nul 2>&1
            if !errorlevel! == 0 (
                echo MOVE "%currentDir%\%%~nxG" "%%F\" >> "%logFile%"
                echo Successfully moved: %%G
            ) else (
                echo Error moving: %%G >> "%logFile%"
                echo Failed to move: %%G
            )
        )
    )
)

echo All files have been moved to: %currentDir%
echo Log of moved files saved to: %logFile%

:: Ask the user if they want to undo the operation
set /p "undo=Would you like to undo this operation? (y/n): "

if /i "!undo!"=="y" (
    echo Undoing the last move operation...
    for /f "tokens=*" %%A in (%logFile%) do (
        :: Reverse the move command in the log file (moving files back)
        if not "%%A"=="Undo Log - Moved Files" (
            call %%A
        )
    )
    echo All files have been restored to their original folders.
    del "%logFile%"
    echo Undo completed. The log file has been deleted.
) else (
    echo Operation complete. No undo performed.
)

pause
exit /b
