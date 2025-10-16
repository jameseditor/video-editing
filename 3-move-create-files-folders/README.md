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
