:: CancelCheck.bat
:: This file checks for cancellation commands: cancel, exit, stop, or /c

:: Check if the user typed any cancellation commands
if /i "%1"=="cancel" goto :cancel
if /i "%1"=="exit" goto :cancel
if /i "%1"=="stop" goto :cancel
if /i "%1"=="/c" goto :cancel
if /i "%1"=="end" goto :cancel

:: If no cancellation command, exit normally
exit /b 0  :: Exit code 0 for normal execution

:cancel
:: Display cancellation message
echo Process cancelled.
pause

:: End of file
exit /b 1  :: Exit code 1 for cancellation
