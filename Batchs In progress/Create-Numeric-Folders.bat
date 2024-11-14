 @echo off
setlocal

REM Prompt for start and end values
set /p "start_num=Enter the starting number: "
set /p "end_num=Enter the ending number: "

REM Ensure start and end are numeric
set /a "start_num+=0" 2>nul || (
    echo Invalid starting number.
    pause
    exit /b
)
set /a "end_num+=0" 2>nul || (
    echo Invalid ending number.
    pause
    exit /b
)

REM Loop to create folders with the specified range and padded numbers
for /L %%i in (%start_num%,1,%end_num%) do (
    set "folder_num=%%i"
    setlocal enabledelayedexpansion
    if %%i LSS 10 (
        set "folder_num=0%%i"
    )
    mkdir "!folder_num!-"
    endlocal
)

echo Folders created from %start_num% to %end_num%.
pause
