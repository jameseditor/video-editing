@echo off
setlocal

:client_project_loop
echo Which Client project are you working on?
echo 1. Republic Studs
echo 2. Generic Stud
echo 3. TommyCBricks
echo 4. Personal Films
echo 5. Editor Assets

set /p client_choice="Choose 1 - 5: "

if "%client_choice%"=="1" (
    echo Opening Republic Studs project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\Republic Studs\Videos\06_Sonic\01_Seqs.prproj"
    start "" "D:\republic studs\2024"
) 

if "%client_choice%"=="2" (
    echo Opening Generic Stud project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
) 

if "%client_choice%"=="3" (
    echo Opening TommyCBricks project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
) 

if "%client_choice%"=="4" (
    echo Opening Personal Films project...
    start "" "F:\videos\editor assets"
    start "" "D:\films\Personal films\Current Videos\TWD Fest\Seqs - Donna Blood.prproj"
    start "" "D:\films"
)

if "%client_choice%"=="5" (
    echo Opening Editor Assets project...
    start "" "F:\videos\editor assets"
)

:: Check for invalid choice
if not "%client_choice%"=="1" if not "%client_choice%"=="2" if not "%client_choice%"=="3" if not "%client_choice%"=="4" if not "%client_choice%"=="5" (
    echo No project selected or invalid choice.
)

:: Prompt to open another client project
set /p open_another_client="Do you want to open another client project? (Y/N): "
if /i "%open_another_client%"=="Y" (
    goto client_project_loop
) else (
    echo Exiting...
)

endlocal