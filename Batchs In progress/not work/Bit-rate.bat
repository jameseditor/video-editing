@echo off
setlocal enabledelayedexpansion

:: Display empty line
echo.

:: Process first file "aoa.mp4"
call :mediainfo General "FileNameExtension Duration/String3 FileSize/String" "aoa.mp4"
echo general_FileNameExtension: %general_FileNameExtension%
echo general_Duration/String3: %general_Duration_String3%
echo general_FileSize/String: %general_FileSize_String%

echo.
call :mediainfo Video "BitRate Duration Bits-(Pixel*Frame)" "aoa.mp4"
echo video_bitrate: %video_Bitrate%
echo video_Duration: %video_Duration%
echo video_BitsPerPixelFrame: %video_BitsPerPixelFrame%

echo.
:: Merge file using mkvmerge
mkvmerge -o aoa_merge.mkv aoa.mp4

:: Process merged file "aoa_merge.mkv"
echo.
call :mediainfo General "FileNameExtension Duration/String3 FileSize/String" "aoa_merge.mkv"
echo general_FileNameExtension: %general_FileNameExtension%
echo general_Duration/String3: %general_Duration_String3%
echo general_FileSize/String: %general_FileSize_String%

echo.
call :mediainfo Video "BitRate Duration Bits-(Pixel*Frame)" "aoa_merge.mkv"
echo video_bitrate: %video_Bitrate%
echo video_Duration: %video_Duration%
echo video_BitsPerPixelFrame: %video_BitsPerPixelFrame%

echo.
:: Convert "aoa.mp4" to "aoa.mkv" using ffmpeg
ffmpeg.exe -i "aoa.mp4" -c copy -y "aoa.mkv"
mkvpropedit.exe --add-track-statistics-tags "aoa.mkv"

:: Process final file "aoa.mkv"
echo.
call :mediainfo General "FileNameExtension Duration/String3 FileSize/String" "aoa.mkv"
echo general_FileNameExtension: %general_FileNameExtension%
echo general_Duration/String3: %general_Duration_String3%
echo general_FileSize/String: %general_FileSize_String%

echo.
call :mediainfo Video "BitRate Duration Bits-(Pixel*Frame)" "aoa.mkv"
echo video_bitrate: %video_Bitrate%
echo video_Duration: %video_Duration%
echo video_BitsPerPixelFrame: %video_BitsPerPixelFrame%

pause
goto :eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:mediainfo
:: Arguments: "section" "parameters" "file"
:: Example: call :mediainfo General "FileNameExtension Duration/String3" "file.mp4"

set "section=%~1"
set "parameters=%~2"
set "file=%~3"

:: Construct mediainfo command
set "cmdline=mediainfo --Inform=%section%;"

:: Parse parameters and build command dynamically
setlocal enabledelayedexpansion
set i=1
for %%G in (%parameters%) do (
    set "varName=!section!_%%G"
    set "cmdline=!cmdline!%%G\="
    set "paramArray[!i!]=!varName!"
    set /a i+=1
)

:: Execute the command and read the results
for /f "tokens=1,* delims=]" %%a in ('%cmdline% "%file%" ^| find /N /V ""') do (
    set varName=!paramArray[%%a]!
    set "!varName!=%%b"
)
endlocal & set "cmdline="
goto :eof
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
