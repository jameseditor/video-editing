# Video Editing Workflow Scripts 

I've been editing videos since 2020 and I found that there's a lot of repetitive things I don't like doing, so I learned how to get the computer to do it for me. 

⚠️ I do not recommend anyone to use my scripts without testing on your system first, I'm not a professional (I'm not responsible for any lost files) ⚠️

##  1-frequent - Batch File Explorer Scripts

### CreateNewVideoFolder.bat [⮺](1-frequent/CreateNewVideoFolder.bat)

- **Purpose:** This script creates a fully structured video project folder with subfolders, icons, shortcuts, and helper files. It is designed to streamline project setup for video editing workflows.  

- **How To Use:**  
    1. Run the `.bat` file.  
    2. Enter a project folder name when prompted.  
        - Allowed: letters, numbers, spaces, and hyphens  
    3. The script will:  
        - Create the project folder and subfolders (`Projects`, `Footage`, `Assets`, `Exports`, `Other`, etc.).  
        - Add nested folders for backups, media assets, and archive exports.  
        - Apply custom icons to main and child folders.  
        - Copy a helper extraction script into the `Footage` folder.  
        - Create a Google Docs setup guide shortcut inside the project folder.  
        - Copy a `README.md` template if available.  
        - Generate a `Notes.txt` file inside the `Other` folder.  
        - Create a `.lnk` shortcut in the `D:\Videos\1-Active-project` directory pointing to the new project folder.  
    4. Once complete, the console will confirm folder creation and shortcut setup.  


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

- **Purpose:** This script allows you to quickly list all files in a given folder. It verifies the entered path, handles cancel/exit commands, and displays the files in a clean list format.  

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

## 99-Archive - DO NOT USE THESE

## Batchs In progress - DO NOT USE THESE

## Templates
A collection of templates from the project and folder structures.

## video-folder-assets 
This is connected to `CreateNewVideoFolder.bat` [⮺](1-frequent/CreateNewVideoFolder.bat)`





