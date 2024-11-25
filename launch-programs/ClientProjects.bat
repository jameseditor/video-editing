@echo off
setlocal

:client_project_loop
cls
echo Which client project are you working on?
echo.
echo 1. Republic Studs
echo 2. Generic Stud
echo 3. TommyCBricks
echo 4. Personal Films
echo 5. Editor Assets
echo.
set /p client_choice="Choose 1 - 5: "

:: Check if the user typed any cancellation commands
if /i "%client_choice%"=="cancel" (
    echo Process cancelled.
    exit /b
)
if /i "%client_choice%"=="exit" (
    echo Process cancelled.
    exit /b
)
if /i "%client_choice%"=="stop" (
    echo Process cancelled.
    exit /b
)

if "%client_choice%"=="1" (
    echo Opening Republic Studs project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\Republic Studs\Videos\06_Sonic\01_Seqs.prproj"
    start "" "D:\republic studs\2024"
    goto end_script
) 

if "%client_choice%"=="2" (
    echo Opening Generic Stud project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
    goto end_script
) 

if "%client_choice%"=="3" (
    echo Opening TommyCBricks project...
    start "" "F:\videos\editor assets"
    start "" "D:\Clients\TommyCBricks\TommyCBricks Videos\Videos\Superhero Tech\01_Seqs.prproj"
    start "" "D:\Clients\TommyCBricks\Youtube\2024"
    goto end_script
) 

if "%client_choice%"=="4" (
    echo Opening Personal Films project...
    start "" "F:\videos\editor assets"
    start "" "D:\films\Personal films\Current Videos\TWD Fest\Seqs - Donna Blood.prproj"
    start "" "D:\films"
    goto end_script
)

if "%client_choice%"=="5" (
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