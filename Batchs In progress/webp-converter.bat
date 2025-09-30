@echo off
setlocal enabledelayedexpansion

:: Get the current directory
set "currentDir=%cd%"

:: Loop through all .webp files in the current folder
for %%f in ("%currentDir%\*.webp") do (
    :: Set the output file name by replacing the .webp extension with .png
    set "outputfile=%%~dpnf.png"

    :: Convert using ImageMagick or ffmpeg (comment out the one you prefer)
    :: Using ImageMagick
    convert "%%f" "!outputfile!"

    :: Or, using FFmpeg (comment out ImageMagick line and use this)
    :: ffmpeg -i "%%f" "!outputfile!"

    echo Converted: %%f to !outputfile!
)

pause
