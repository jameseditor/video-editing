@echo off
setlocal

:program_choice_loop
echo Which program do you want to launch?
echo 1. Firefox
echo 2. Premiere Pro
echo 3. Editor Assets
echo 4. Photoshop
echo 5. After Effects
echo 6. 4K Video Downloader
echo 7. OBS
echo 8. Shutter Encoder
echo 9. TourBox

set /p program_choice="Choose 1 - 9: "

if "%program_choice%"=="1" (
    echo Opening Mozilla Firefox...
    start "" "C:\Program Files\Mozilla Firefox\firefox.exe"
)

if "%program_choice%"=="2" (
    echo Opening Premiere Pro...
    start "" "C:\Program Files\Adobe\Adobe Premiere Pro 2024\Adobe Premiere Pro.exe"
)

if "%program_choice%"=="3" (
    echo Opening Editor Assets...
    start "" "F:\videos\editor assets"
)

if "%program_choice%"=="4" (
    echo Opening Adobe Photoshop...
    start "" "C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe"
)

if "%program_choice%"=="5" (
    echo Opening Adobe After Effects...
    start "" "C:\Program Files\Adobe\Adobe After Effects 2025\Support Files\AfterFX.exe"
)

if "%program_choice%"=="6" (
    echo Opening 4K Video Downloader...
    start "" "C:\Program Files (x86)\4KDownload\4kvideodownloaderplus\4kvideodownloaderplus.exe"
)

if "%program_choice%"=="7" (
    echo Opening OBS Studio...
    start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\OBS Studio (64bit).lnk"
)

if "%program_choice%"=="8" (
    echo Opening Shutter Encoder...
    start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Shutter Encoder\Shutter Encoder.lnk"
)

if "%program_choice%"=="9" (
    echo Opening TourBox Console...
    start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TourBox Console\TourBox Console.lnk"
)

:: Check for invalid choice
if not "%program_choice%"=="1" if not "%program_choice%"=="2" if not "%program_choice%"=="3" if not "%program_choice%"=="4" if not "%program_choice%"=="5" if not "%program_choice%"=="6" if not "%program_choice%"=="7" if not "%program_choice%"=="8" if not "%program_choice%"=="9" (
    echo No program selected or invalid choice.
)

:: Prompt to open another program
set /p open_another_program="Do you want to open another program? (Y/N): "
if /i "%open_another_program%"=="Y" (
    goto program_choice_loop
) else (
    echo Exiting...
)

endlocal