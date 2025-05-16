@echo off
:: Check if there are any MKV files in the current directory
set found=false

for %%f in (*.mkv) do (
    set found=true
    :: Convert MKV to MP4 without re-encoding
    ffmpeg -i "%%f" -c:v copy -c:a copy "%%~nf.mp4"
)

:: If no MKV files are found, notify the user
if not %found%==true (
    echo No MKV files found in the current directory.
)

:: Pause to view results
pause
