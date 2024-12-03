@echo off

:: Ask the user for the folder name
set /p folderName="Enter the name of the folder: "

:: Remove spaces and convert to lowercase
echo Enter folder name:
set "folderName=%folderName: =%"
for %%f in (%folderName%) do set folderName=%%f
set folderName=%folderName: =%
set folderName=%folderName:~0%

:: Check if the folder already exists
if exist "%cd%\%folderName%" (
    echo Folder "%folderName%" already exists. Please choose a different name.
    pause
    exit /b
)

:: Convert the folder name to lowercase
set "folderName=%folderName: =%"
:: Create the new folder
md "%cd%\%folderName%"

:: Create empty HTML file in the new folder
echo. > "%cd%\%folderName%\index.html"

:: Create empty CSS file in the new folder
echo. > "%cd%\%folderName%\styles.css"

:: Create empty JS file in the new folder
echo. > "%cd%\%folderName%\script.js"

:: creates images folder
md "%cd%\%folderName%\images"

echo Files created in folder "%folderName%": index.html, styles.css, and script.js (empty)
pause
