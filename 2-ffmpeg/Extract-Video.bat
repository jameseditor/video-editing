@echo off
:: Check if there are any MP4 files in the current directory
set found=false

for %%f in (*.mp4) do (
    set found=true
    :: Extract the video stream only (no audio)
    ffmpeg -i "%%f" -c copy -an "video_only_%%~nf.mp4"
)

:: If no MP4 files are found, notify the user
if not %found%==true (
    echo No MP4 files found in the current directory.
)

:: Pause to view results
pause
