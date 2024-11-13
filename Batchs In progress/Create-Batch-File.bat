@echo off
setlocal

REM Prompt the user for the new batch file name
set /p "filename=Enter the name for the new batch file (without extension): "

REM Add .bat extension to the filename
set "new_file=%filename%.bat"

REM Create an empty batch file
echo. > "%new_file%"

REM Notify the user of the file creation
echo New batch file created: %new_file%
pause
