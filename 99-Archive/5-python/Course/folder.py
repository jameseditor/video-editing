import os

# Get the directory where the current script is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Define the new folder path relative to the script
folder_path = os.path.join(script_dir, "MyNewFolder")

# Create the folder
os.makedirs(folder_path, exist_ok=True)

print(f"Folder created at: {folder_path}")
