# Video Editing Workflow Scripts 

##  1-frequent - Batch File Explorer Scripts

### CreateNewVideoFolder.bat

This batch script streamlines the creation of a standardized folder structure for video projects and automatically generates a shortcut to the main project folder. It prompts the user for a project name, validates it to ensure no special characters or duplicates, and creates folders for organizing assets, footage, timelines, and subcategories like A-roll and B-roll. The script then generates a shortcut to the newly created project folder and places it in `D:\Videos\1-Active-project` for quick access. Additionally, it includes help and cancel options for ease of use and user guidance.

(there are some parts of the script that link to folder icons on my pc)

### un-zip-extract-here.bat

This script automates the extraction of `.zip` files in the current directory using 7-Zip and moves the original `.zip` files to the Recycle Bin. Upon running, the script prompts the user to confirm whether they want to proceed with the extraction, cancel the process, or view the help message. It checks if `.zip` files exist in the directory, ensures that 7-Zip is installed, and then extracts each `.zip` file. After extraction, the original `.zip` files are moved to the Recycle Bin using PowerShell. The user can cancel the operation or request help at any time. The script provides feedback on successful or failed actions throughout the process.

**Before:**

       ├──  Folder.zip

              └── Subfolder 
       
                   └── john.txt 
**After:**

       ├── Subfolder
  
              └── john.txt




### file-showcase-list.bat

Will show the full list of files in a folder so you can copy them to a txt, I used this when I use ai sometimes.


### Create-Numeric-Folders.bat

This batch script automates folder creation with a numbering system.    
- Creates new folders with a numeric prefix (`01-ProjectName`) while preventing duplicates, invalid names, or empty inputs.  
- Keeps your projects organized and consistently named without manual renaming or errors.




## 1-ffmpeg - Video creation files

### ConvertMKVtoMP4.bat

* **Purpose:** This script converts all `.mkv` files in the current directory to `.mp4` format without re-encoding (preserving original video and audio quality). If no `.mkv` files are found, it notifies the user.
* **How To Use:**

  1. Place the script in the folder containing your `.mkv` files.
  2. Double-click the `.bat` file to run it.
  3. The script will automatically create `.mp4` versions of all `.mkv` files in the folder.
  4. If no `.mkv` files are found, a message will appear.
  5. Press any key when finished to close the script window.



### Extract-Video.bat

* **Purpose:** This script extracts the audio track from all `.mp4` files in the current directory and saves them as `.mp3` files with `-audio-only` added to the filename. If no `.mp4` files are found, it notifies the user.
* **How To Use:**

  1. Place the script in the folder containing your `.mp4` files.
  2. Double-click the `.bat` file to run it.
  3. The script will generate `.mp3` files with `-audio-only` appended to their names.
  4. If no `.mp4` files are found, a message will appear.


### ExtractAudio.bat

- **Purpose:** This script extracts the video stream from all `.mp4` files in the current directory, removing the audio track. The resulting files are saved with `video_only_` prefixed to the original filename. If no `.mp4` files are found, it notifies the user.  
- **How To Use:**  
    1. Place the script in the folder containing your `.mp4` files.  
    2. Double-click the `.bat` file to run it.  
    3. The script will generate new `.mp4` files containing only the video stream, prefixed with `video_only_`.  
    4. If no `.mp4` files are found, a message will appear.  



### VFR-Detector.bat

- **Purpose:** This script scans all video files (`.mp4`, `.mov`, `.mkv`, `.avi`) in the current folder and its subfolders, using MediaInfo to check the FrameRate Mode of each file. It alerts the user if a file uses Variable Frame Rate (VFR).  
- **How To Use:**  
    1. Make sure MediaInfo is installed at `C:\Program Files\MediaInfo\MediaInfo.exe` or update the path in the script.  
    2. Place the script in the folder you want to scan.  
    3. Run the `.bat` file. Each video file will be checked for its FrameRate Mode.  
    4. If a file is detected as VFR, a warning message will be displayed.  
    5. Follow the on-screen instructions to close MediaInfo tabs using `ALT + F4` as the script progresses.  
