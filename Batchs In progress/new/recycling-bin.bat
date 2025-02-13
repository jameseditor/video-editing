@echo off
setlocal enabledelayedexpansion

:: Set the working directory to the location of this script
cd /d "%~dp0"

:: Move all .zip files to the Recycle Bin using Shell.Application
echo Moving .zip files to the Recycle Bin...
for %%Z in (*.zip) do (
    powershell -Command "$shell = New-Object -ComObject Shell.Application; $file = $shell.Namespace('%%~dpZ'); $fileItem = $file.ParseName('%%~nxZ'); $fileItem.InvokeVerb('delete')"
    if !errorlevel! equ 0 (
        echo Moved "%%Z" to the Recycle Bin.
    ) else (
        echo Failed to move "%%Z" to the Recycle Bin.
    )
)

echo All .zip files have been moved to the Recycle Bin.
pause
