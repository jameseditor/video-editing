@echo off
setlocal

:client_project_loop
cls
:: Display the question and options in default color (no color change here)
echo Which client project are you working on?
echo.
echo 1. Republic Studs
echo 2. Generic Stud
echo 3. TommyCBricks
echo 4. Personal Films
echo 5. Editor Assets
echo.

:: Set the color to default (no color change)
color 07

set /p clientChoice="Choose 1 - 5: "

:: Check if the user typed any cancellation commands
if /i "%clientChoice%"=="cancel" goto :cancel
if /i "%clientChoice%"=="exit" goto :cancel
if /i "%clientChoice%"=="stop" goto :cancel
if /i "%clientChoice%"=="/c" goto :cancel
if /i "%clientChoice%"=="end" goto :cancel

:: Change the color to green once an option (1-5) is selected
if "%clientChoice%"=="1" (
    color 0A
    echo Opening Republic Studs project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\Republic Studs\Videos\06_Sonic\01_Seqs.prproj"
    start "" "D:\republic studs\2024"
    goto end_script
) 

if "%clientChoice%"=="2" (
    color 0A
    echo Opening Generic Stud project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
    goto end_script
) 

if "%clientChoice%"=="3" (
    color 0A
    echo Opening TommyCBricks project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
    goto end_script
) 

if "%clientChoice%"=="4" (
    color 0A
    echo Opening Personal Films project...
    start "" "F:\videos\editor assets"
    start "" "D:\films\Personal films\Current Videos\TWD Fest\Seqs - Donna Blood.prproj"
    start "" "D:\films"
    goto end_script
)

if "%clientChoice%"=="5" (
    color 0A
    echo Opening Editor Assets project...
    start "" "F:\videos\editor assets"
    goto end_script
)

:: Check for invalid choice
echo Invalid choice, please select a valid option.
timeout /t 2 >nul
goto client_project_loop

:end_script
echo Exiting...
endlocal

:cancel
:: Display cancellation message with color red
color 0C
echo Process cancelled. No action performed.
pause
exit /b
