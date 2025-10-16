# Video Editing Workflow Scripts 

A collection of scripts that were designed to save time as a video editor, they were specifically designed for my workflow.

⚠️ I do not recommend anyone to use my scripts without testing on your system first or knowing how to use a batch file, I'm not a professional (I'm not responsible for any lost files) ⚠️

##  1-frequent - Batch File Explorer Scripts

### CreateNewVideoFolder.bat [⮺](1-frequent/CreateNewVideoFolder.bat)

- **Purpose:** This script creates a fully structured video project folder with subfolders, icons, shortcuts, and helper files. It is designed to streamline project setup for video editing workflows.  

- **How To Use:**  
    1. Run the `.bat` file.  
    2. Enter a project folder name when prompted.  
    3. The script will:  
        - Create the project folder and subfolders (`Projects`, `Footage`, `Assets`, `Exports`, `Other`, etc.).  
        - Apply custom icons to main and child folders.  
        - Copy a helper extraction script [un-zip-extract-here.bat](1-frequent/un-zip-extract-here.bat) into the `Footage` folder.  
        - Create a Google Docs setup guide shortcut inside the project folder.  
        - Copy `README.md` and create a `Notes.txt` files.  
        - Create a folder shortcut in the `D:\Videos\1-Active-project` (change this for Personal Setup).    


(there are some parts of the script that link to folder icons on my pc)

### un-zip-extract-here.bat [⮺](1-frequent/un-zip-extract-here.bat)

- **Purpose:** This script extracts all `.zip` files in the current directory using **7-Zip**, then automatically moves the original `.zip` files to the Recycle Bin. It ensures your workspace stays clean after extraction.  

- **How To Use:**  
  1. Place the script in the same directory as your `.zip` files.  
  2. Run the script.  
  3. When prompted:  
     - Type **y** to extract and move `.zip` files to the Recycle Bin.  
     - Type **c** to cancel and exit.  
     - Type **h** for detailed help.  
  4. Extracted files will appear in the same directory, and the original archives will be deleted to the Recycle Bin.  

- **Requirements:**  
  - [7-Zip](https://www.7-zip.org/) must be installed in the default path:  
    `C:\Program Files\7-Zip\7z.exe`  

**Before:**

       ├──  Folder.zip

              └── Subfolder 
       
                   └── john.txt 
**After:**

       ├── Subfolder
  
              └── john.txt




### file-showcase-list.bat [⮺](1-frequent/file-showcase-list.bat)

- **Purpose:** This script allows you to quickly list all files in a given folder.

- **How To Use:**  
  1. Enter the full path of the folder you want to list files from.  
  2. The script will display all files in that folder.  



### Create-Numeric-Folders.bat [⮺](1-frequent/Create-Numeric-Folders.bat)

- **Purpose:** This batch script automates folder creation with a numbering system.

- **How To Use:**   
- Creates new folders with a numeric prefix (`01-ProjectName`) while preventing duplicates, invalid names, or empty inputs.  
- Keeps your projects organized and consistently named without manual renaming or errors.




## 2-ffmpeg - Video Creation Batchs

### ConvertMKVtoMP4.bat [⮺](2-ffmpeg/ConvertMKVtoMP4.bat)

* **Purpose:** This script converts all `.mkv` files in the current directory to `.mp4` format without re-encoding (preserving original video and audio quality). If no `.mkv` files are found, it notifies the user.
* **How To Use:**

  1. Place the script in the folder containing your `.mkv` files.
  2. Double-click the `.bat` file to run it.
  3. The script will automatically create `.mp4` versions of all `.mkv` files in the folder.
  4. If no `.mkv` files are found, a message will appear.
  5. Press any key when finished to close the script window.



### Extract-Video.bat [⮺](2-ffmpeg/Extract-Video.bat)

* **Purpose:** This script extracts the audio track from all `.mp4` files in the current directory and saves them as `.mp3` files with `-audio-only` added to the filename. If no `.mp4` files are found, it notifies the user.
* **How To Use:**

  1. Place the script in the folder containing your `.mp4` files.
  2. Double-click the `.bat` file to run it.
  3. The script will generate `.mp3` files with `-audio-only` appended to their names.
  4. If no `.mp4` files are found, a message will appear.


### ExtractAudio.bat [⮺](2-ffmpeg/ExtractAudio.bat)

- **Purpose:** This script extracts the video stream from all `.mp4` files in the current directory, removing the audio track. The resulting files are saved with `video_only_` prefixed to the original filename. If no `.mp4` files are found, it notifies the user.  
- **How To Use:**  
    1. Place the script in the folder containing your `.mp4` files.  
    2. Double-click the `.bat` file to run it.  
    3. The script will generate new `.mp4` files containing only the video stream, prefixed with `video_only_`.  
    4. If no `.mp4` files are found, a message will appear.  



### VFR-Detector.bat [⮺](2-ffmpeg/VFR-Detector.bat)

- **Purpose:** This script scans all video files (`.mp4`, `.mov`, `.mkv`, `.avi`) in the current folder and its subfolders, using MediaInfo to check the FrameRate Mode of each file. It alerts the user if a file uses Variable Frame Rate (VFR).  
- **How To Use:**  
    1. Make sure MediaInfo is installed at `C:\Program Files\MediaInfo\MediaInfo.exe` or update the path in the script.  
    2. Place the script in the folder you want to scan.  
    3. Run the `.bat` file. Each video file will be checked for its FrameRate Mode.  
    4. If a file is detected as VFR, a warning message will be displayed.  
    5. Follow the on-screen instructions to close MediaInfo tabs using `ALT + F4` as the script progresses.  

## 3-move-create-files-folders - Batchs Creation 

<<<<<<< HEAD

=======
>>>>>>> b4c18fc6c9b017b88bb2b1a8b955ac6c8cdf976d
## 99-Archive - DO NOT USE THESE

## Batchs In progress - DO NOT USE THESE

## Templates
A collection of templates from the project and folder structures.

## video-folder-assets 
This is connected to `CreateNewVideoFolder.bat` [⮺](1-frequent/CreateNewVideoFolder.bat)`





