import os
import re
import time

def create_folder_structure(base_folder):
    # Create the main folders
    os.makedirs(os.path.join(base_folder, "Assets"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Footage"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Timelines"), exist_ok=True)

    # Create subfolders in Assets
    os.makedirs(os.path.join(base_folder, "Assets", "1 - Clips"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Assets", "2 - Images"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Assets", "3 - Music Extra"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Assets", "4 - SFX Extra"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Assets", "5 - Other"), exist_ok=True)

    # Create subfolders in Footage
    os.makedirs(os.path.join(base_folder, "Footage", "A-roll"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Footage", "A-roll", "Audio"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Footage", "B-roll"), exist_ok=True)
    os.makedirs(os.path.join(base_folder, "Footage", "Renders"), exist_ok=True)

def main():
    print("This script will create a folder structure for your video project.\n")
    
    while True:
        project_name = input("Enter the project folder name (type 'cancel', 'exit', or 'stop' to exit): ").strip()
        
        # Handle cancellation commands
        if project_name.lower() in ["cancel", "exit", "stop", "end", "/c"]:
            print("Process cancelled.")
            break
        
        # Check for invalid characters
        if re.search(r"[!@#$%^&*()]", project_name):
            print("Project name contains special characters. Please use only letters and numbers.")
            continue
        
        # Check if the project folder already exists
        if os.path.exists(project_name):
            print(f'The folder "{project_name}" already exists.')
            continue
        
        # Check if the name is empty
        if not project_name:
            print("You must enter a valid project name.")
            continue
        
        # Create folder structure
        create_folder_structure(project_name)
        print(f'Folder structure created inside "{project_name}" successfully!')
        
        # Countdown before closing
        for i in range(3, 0, -1):
            print(f"Closing in {i} seconds...")
            time.sleep(1)
        break

if __name__ == "__main__":
    main()
