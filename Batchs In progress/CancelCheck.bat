:: CancelCheck.bat
:: This file checks for cancellation commands: cancel, exit, stop, or /c

:: Check if the user typed any cancellation commands
if /i "%1"=="cancel" (
    echo Process cancelled.
    exit /b 1
)
if /i "%1"=="exit" (
    echo Process cancelled.
    exit /b 1
)
if /i "%1"=="stop" (
    echo Process cancelled.
    exit /b 1
)
if /i "%1"=="/c" (
    echo Program closing. No file will be created.
    exit /b 1
)

:: If no cancellation command is typed, exit successfully (exit code 0)
exit /b 0
