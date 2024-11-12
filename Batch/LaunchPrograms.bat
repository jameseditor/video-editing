@echo off
setlocal

:project_choice_loop
echo Which Client project are you working on?
echo 1. Republic Studs
echo 2. Generic Stud
echo 3. TommyCBricks
echo 4. Personal Films
echo 5. Editor Assets
echo 6. Premiere Pro
echo 7. Adobe Photoshop
echo 8. Mozilla Firefox
echo 9. Adobe After Effects

set /p project_choice="Choose 1 - 9: "

if "%project_choice%"=="1" (
    echo Opening Republic Studs project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\Republic Studs\Videos\06_Sonic\01_Seqs.prproj"
    start "" "D:\republic studs\2024"
) 

if "%project_choice%"=="2" (
    echo Opening Generic Stud project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
) 

if "%project_choice%"=="3" (
    echo Opening TommyCBricks project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
) 

if "%project_choice%"=="4" (
    echo Opening Personal Films project...
    start "" "F:\videos\editor assets"
    start "" "D:\films\Personal films\Current Videos\TWD Fest\Seqs - Donna Blood.prproj"
    start "" "D:\films"
)

if "%project_choice%"=="5" (
    echo Opening Editor Assets project...
    start "" "F:\videos\editor assets"
)

if "%project_choice%"=="6" (
    echo Opening Premiere Pro project...
    start "" "C:\Program Files\Adobe\Adobe Premiere Pro 2024\Adobe Premiere Pro.exe"
)

if "%project_choice%"=="7" (
    echo Opening Adobe Photoshop...
    start "" "C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe"
)

if "%project_choice%"=="8" (
    echo Opening Mozilla Firefox...
    start "" "C:\Program Files\Mozilla Firefox\firefox.exe"
)

if "%project_choice%"=="9" (
    echo Opening Adobe After Effects...
    start "" "C:\Program Files\Adobe\Adobe After Effects 2025\Support Files\AfterFX.exe"
)

:: If the input is not 1-9
if not "%project_choice%"=="1" if not "%project_choice%"=="2" if not "%project_choice%"=="3" if not "%project_choice%"=="4" if not "%project_choice%"=="5" if not "%project_choice%"=="6" if not "%project_choice%"=="7" if not "%project_choice%"=="8" if not "%project_choice%"=="9" (
    echo No project selected or invalid choice.
)

:: Prompt to open another project
set /p open_another="Do you want to open another project? (Y/N): "
if /i "%open_another%"=="Y" (
    goto project_choice_loop
) else (
    echo Exiting...
)

endlocal