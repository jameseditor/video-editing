import os
import shutil
import subprocess
import py7zr

# Define the path to 7-Zip
SEVEN_ZIP_PATH = r 
"C:\Program Files\7-Zip\7z.exe"

def check_7zip_installed():
    if not os.path.exists(SEVEN_ZIP_PATH):
        print("7-Zip not found. Please make sure it is installed in C:\\Program Files\\7-Zip.")
        return False
    return True

def extract_zip(zip_file, extract_to):
    with py7zr.SevenZipFile(zip_file, 'r') as archive:
        archive.extractall(extract_to)
    print(f'Successfully extracted "{zip_file}" to folder "{extract_to}".')

def move_subfolders_to_parent(extracted_folder):
    for item in os.listdir(extracted_folder):
        item_path = os.path.join(extracted_folder, item)
        if os.path.isdir(item_path):
            shutil.move(item_path, '.')
            print(f'Successfully moved "{item}" to the parent directory.')

def delete_file(file_path):
    try:
        os.remove(file_path)
        print(f'Deleted "{file_path}".')
    except Exception as e:
        print(f'Failed to delete "{file_path}". Error: {e}')

def delete_folder(folder_path):
    try:
        shutil.rmtree(folder_path)
        print(f'Deleted extracted folder "{folder_path}".')
    except Exception as e:
        print(f'Failed to delete "{folder_path}". Error: {e}')

def main():
    if not check_7zip_installed():
        return

    # Ask the user if they want to delete the zip files after extraction
    delete_zip = input("Do you want to delete the zip files after extraction? (Y/N): ").strip().upper()
    if delete_zip not in ("Y", "N"):
        print("Invalid input, please enter Y or N.")
        return

    # Process each .zip file in the current directory
    for zip_file in os.listdir('.'):
        if zip_file.endswith(".zip"):
            zip_file_path = os.path.join('.', zip_file)
            extract_to = os.path.splitext(zip_file)[0]

            # Extract the zip file
            print(f'Extracting "{zip_file}"...')
            extract_zip(zip_file_path, extract_to)

            # Move subfolders to parent directory
            move_subfolders_to_parent(extract_to)

            # Delete the zip file and extracted folder if the user opted to
            if delete_zip == "Y":
                delete_file(zip_file_path)
                delete_folder(extract_to)

    print("All zip files have been processed.")

if __name__ == "__main__":
    main()
