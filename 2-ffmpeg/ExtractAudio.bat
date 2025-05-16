@echo off
:: Check if there are any MP4 files in the current directory
set found=false

for %%f in (*.mp4) do (
    set found=true
    :: Extract the audio track and save it as MP3 with -audio-only in the filename
    ffmpeg -i "%%f" -q:a 0 -map a "%%~nf-audio-only.mp3"
)

:: If no MP4 files are found, notify the user
if not %found%==true (
    echo No MP4 files found in the current directory.
)

:: Pause to view results
pause
