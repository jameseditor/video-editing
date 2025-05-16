import os

# Get the directory where the current script is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Define the new folder path relative to the script
folder_path = os.path.join(script_dir, "Video-Folder")

# Create the main folder
os.makedirs(folder_path, exist_ok=True)
print(f"Main folder created at: {folder_path}")

# Define subfolders to create inside the main folder
subfolders = ["Assets", "Footage", "Timelines"]
subfolder_structure = ["1-Clips", "2-Images",
                       "3-Music-Extra", "4-SFX-Extra", "5-Other"]
subfolder_footage = ["A-roll", "B-roll", "Renders"]

# Create subfolders in "Video-Folder"
for subfolder in subfolders:
    subfolder_path = os.path.join(folder_path, subfolder)
    os.makedirs(subfolder_path, exist_ok=True)
    print(f"Created subfolder: {subfolder_path}")

# Create additional subfolders inside "Video-Folder/Assets"
for subfolder in subfolder_structure:
    subfolder_path = os.path.join(folder_path, "Assets", subfolder)
    os.makedirs(subfolder_path, exist_ok=True)
    print(f"Created subfolder: {subfolder_path}")

# Create additional subfolders inside "Video-Folder/Footage"
for subfolder in subfolder_footage:
    subfolder_path = os.path.join(folder_path, "Footage", subfolder)
    os.makedirs(subfolder_path, exist_ok=True)
    print(f"Created subfolder: {subfolder_path}")

print("\nAll folders and subfolders created successfully!")
