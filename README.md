# Video Editing Workflow Scripts 

I've been editing videos since 2020 and I found that there's a lot of repetitive things I don't like doing, so I learned how to get the computer to do it for me. 

⚠️ I do not recommend anyone to use my scripts without testing on your system first, I'm not a professional (I'm not responsible for any lost files) ⚠️

##  1-frequent - Batch File Explorer Scripts

### CreateNewVideoFolder.bat [⮺](1-frequent/CreateNewVideoFolder.bat)

This batch script streamlines the creation of a standardized folder structure for video projects and automatically generates a shortcut to the main project folder. It prompts the user for a project name, validates it to ensure no special characters or duplicates, and creates folders for organizing assets, footage, timelines, and subcategories like A-roll and B-roll. The script then generates a shortcut to the newly created project folder and places it in `D:\Videos\1-Active-project` for quick access. Additionally, it includes help and cancel options for ease of use and user guidance.

(there are some parts of the script that link to folder icons on my pc)

### un-zip-extract-here.bat [⮺](1-frequent/un-zip-extract-here.bat)

This script automates the extraction of `.zip` files in the current directory using 7-Zip and moves the original `.zip` files to the Recycle Bin. Upon running, the script prompts the user to confirm whether they want to proceed with the extraction, cancel the process, or view the help message. It checks if `.zip` files exist in the directory, ensures that 7-Zip is installed, and then extracts each `.zip` file. After extraction, the original `.zip` files are moved to the Recycle Bin using PowerShell. The user can cancel the operation or request help at any time. The script provides feedback on successful or failed actions throughout the process.

**Before:**

       ├──  Folder.zip

              └── Subfolder 
       
                   └── john.txt 
**After:**

       ├── Subfolder
  
              └── john.txt




### file-showcase-list.bat [⮺](1-frequent/file-showcase-list.bat)

Will show the full list of files in a folder so you can copy them to a txt, I used this when I use ai sometimes.


### Create-Numeric-Folders.bat [⮺](1-frequent/Create-Numeric-Folders.bat)

This batch script automates folder creation with a numbering system.    
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

## 3-move-create-files-folders - Video Creation Batchs




### Create-Archive-Folder.bat [⮺](3-move-create-files-folders/Create-Archive-Folder.bat)

- **Purpose:** This script creates a new folder in the same directory as the script. The user can specify a custom folder name, or it will default to `Archive` if no name is provided. It also prevents overwriting existing folders.  
- **How To Use:**  
    1. Place the script in the directory where you want to create the folder.  
    2. Run the `.bat` file.  
    3. Enter a custom folder name when prompted, or press ENTER to create a folder named `Archive`.  
    4. The script will create the folder if it does not already exist and notify you of success.  
    5. If the folder already exists, no action will be taken.  

### Create-Batch.bat [⮺](3-move-create-files-folders/Create-Batch.bat)

- **Purpose:** This script creates a new batch file based on a template and allows the user to define its name. It replaces spaces with hyphens, prevents overwriting existing files, and includes a built-in cancellation check. If Visual Studio Code is installed, the new batch file will automatically open for editing.  
- **How To Use:**  
    1. Run the `.bat` file.  
    2. Enter a name for the new batch file when prompted. Spaces will automatically be replaced with hyphens.  
    3. If the filename already exists, you will be prompted to enter a different name.  
    4. The script creates a new batch file with template content, including a cancellation subroutine.  
    5. If Visual Studio Code is installed at the specified path, the new file will open automatically for editing.  


### Create-txt.bat [⮺](3-move-create-files-folders/Create-txt.bat)

- **Purpose:** This script creates a new text file in the same directory as the batch file. It prompts the user for a file name, prevents overwriting existing files, and allows cancellation using several commands (`/c`, `cancel`, `exit`, `stop`, `end`).  
- **How To Use:**  
    1. Run the `.bat` file.  
    2. Enter a name for the new text file when prompted.  
    3. If the name is empty or the file already exists, you will be prompted again.  
    4. To cancel the operation, type `/c`, `cancel`, `exit`, `stop`, or `end`.  
    5. Once a valid name is entered, the script will create a `.txt` file in the same folder as the batch file.  


### CreateWebsiteSetup.bat [⮺](3-move-create-files-folders/CreateWebsiteSetup.bat)

- **Purpose:** This script creates a new web project folder with a specified name. It sets up an empty `index.html`, `styles.css`, `script.js` file, and an `images` subfolder. The script prevents overwriting existing folders.  
- **How To Use:**  
    1. Run the `.bat` file.  
    2. Enter a name for the new project folder when prompted. Spaces will be removed automatically.  
    3. If the folder already exists, you will be prompted to choose a different name.  
    4. The script will create the folder along with empty `index.html`, `styles.css`, `script.js` files and an `images` folder inside it.  

## 99-Archive - DO NO USE THESE

## Batchs In progress - DO NO USE THESE

## Templates
A collection of templates from the project and folder structures.

## video-folder-assets 
this this is connected to `CreateNewVideoFolder.bat` [⮺](1-frequent/CreateNewVideoFolder.bat)`





