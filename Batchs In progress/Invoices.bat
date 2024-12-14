@echo off
echo Choose a client:
echo 1. Republic Studs
echo 2. Generic Stud
echo 3. TommyCBricks
echo 4. Description
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    echo kookoo4kermit@gmail.com | clip
    echo Republic Studs email copied to clipboard.
) else if "%choice%"=="2" (
    echo jwrs2005@gmail.com | clip
    echo Generic Stud email copied to clipboard.
) else if "%choice%"=="3" (
    echo tommycbricksbusiness@gmail.com | clip
    echo TommyCBricks email copied to clipboard.
)
else if "%choice%"=="4" (
    echo Video editing services. | clip
    echo Description email copied to clipboard.
)
 else (
    echo Invalid choice. Please select a valid option 1-3.
)