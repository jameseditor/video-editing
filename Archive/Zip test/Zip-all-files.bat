@echo off
setlocal

:: Set the folder containing this batch file as the output directory
set "outputDir=%~dp0"

:: Prompt the user for the folder they want to zip
set /p folder="Enter the full path of the folder you want to zip: "

:: Prompt for the zip file name
set /p zipName="Enter the name for the zip file (without extension): "

:: Get the full path of this batch file to exclude it from the zip
set "batchFile=%~f0"

:: Create a temporary list of files to zip, excluding the batch file
echo Creating list of files to zip...
set "tempList=%temp%\filelist.txt"
del "%tempList%" >nul 2>&1

for /r "%folder%" %%f in (*) do (
    if /i not "%%f"=="%batchFile%" (
        echo %%f >> "%tempList%"
    )
)

:: Zip the files using PowerShell
echo Zipping the files into "%zipName%.zip"...
powershell -command "Compress-Archive -Path (Get-Content '%tempList%') -DestinationPath '%outputDir%\%zipName%.zip'"

:: Cleanup the temporary list file
del "%tempList%"

echo Successfully created the zip file: "%outputDir%\%zipName%.zip"
pause
endlocal
