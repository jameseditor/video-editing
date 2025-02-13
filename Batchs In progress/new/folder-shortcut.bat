@echo off

set /p projectName=Enter the project folder name ("help" for assistance.): 


:: Set the target folder (the folder you want to create a shortcut to)
set "targetFolder=D:\Personal\Editing socials"

:: Set the location and name of the shortcut
set "shortcutPath=D:\Personal\shortcut\%projectName%.lnk"

:: Use PowerShell to create the shortcut
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutPath%'); $Shortcut.TargetPath = '%targetFolder%'; $Shortcut.Save()"

echo Shortcut created on your desktop: %shortcutPath%
pause
