# Scripts that speed up my video editing workflow

## Batch File Explorer Scripts in `1-frequent`

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


# Create-Numeric-Folders.bat

This batch script automates folder creation with a numbering system.  

- **What it does:**  
  Creates new folders with a numeric prefix (`01-ProjectName`) while preventing duplicates, invalid names, or empty inputs.  

- **Why use it:**  
  Keeps your projects organized and consistently named without manual renaming or errors.
