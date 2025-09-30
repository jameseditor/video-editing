import os
import shutil
import subprocess


def validate_project_name(name, base_path):
    invalid_chars = set('<>:"/\\|?*')
    if not name.strip():
        print("❌ Project name cannot be empty.")
        return False
    if any(char in invalid_chars for char in name):
        print("❌ Invalid characters in project name.")
        return False
    if os.path.exists(os.path.join(base_path, name)):
        print(f"❌ The folder '{name}' already exists.")
        return False
    return True


def create_subfolders(parent, subfolders):
    for sub in subfolders:
        path = os.path.join(parent, sub)
        os.makedirs(path, exist_ok=True)
        print(f"📁 Created: {path}")


def copy_script(source, destination):
    os.makedirs(destination, exist_ok=True)
    if os.path.exists(source):
        shutil.copy(source, destination)
        print("📄 Script copied to B-roll.")
    else:
        print("⚠️ Script not found:", source)


def create_shortcut(folder_path, shortcut_dir):
    base_name = os.path.basename(folder_path)
    shortcut_path = os.path.join(shortcut_dir, f"{base_name}.lnk")
    count = 1
    while os.path.exists(shortcut_path):
        shortcut_path = os.path.join(shortcut_dir, f"{base_name}-{count}.lnk")
        count += 1

    powershell_script = f"""
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut('{shortcut_path}')
    $Shortcut.TargetPath = '{folder_path}'
    $Shortcut.Save()
    """
    subprocess.run(["powershell", "-Command", powershell_script], shell=True)
    if os.path.exists(shortcut_path):
        print("✅ Shortcut created:", shortcut_path)
    else:
        print("❌ Failed to create the shortcut.")

# === MAIN PROGRAM ===


base_path = os.getcwd()
source_script = r"D:\Personal\video-editing-scripts\1-frequent\un-zip-extract-here.bat"
shortcut_directory = r"D:\Videos\1-Active-project"

print("=" * 50)
print("📂 This script will create a folder structure for your video project.")
print("=" * 50)
print("Commands:\n[Enter] - Create folders\n[C] - Cancel\n[H] - Help\n")

while True:
    project_name = input('Enter project folder name ("H" for help): ').strip()
    if project_name.lower() == "c":
        break
    if project_name.lower() == "h":
        print("=" * 50)
        print("HELP")
        print("=" * 50)
        print("- Use letters, numbers, spaces, or hyphens.")
        print('- Avoid: < > : " / \\ | ? *')
        print('- Folders Created: Assets, Footage, Timelines, etc.')
        print('- Cancel: Type \"C\" to cancel.')
        print("=" * 50)
        continue

    project_name = project_name.replace(" ", "-")
    project_path = os.path.join(base_path, project_name)

    if not validate_project_name(project_name, base_path):
        continue

    os.makedirs(project_path, exist_ok=True)
    print(f"\n📁 Created: {project_path}")
    create_subfolders(project_path, ["Assets", "Footage", "Timelines"])
    create_subfolders(os.path.join(project_path, "Assets"),
                      ["1-Clips", "2-Images", "3-Music-Extra", "4-SFX-Extra", "5-Other"])
    create_subfolders(os.path.join(project_path, "Footage"),
                      ["A-roll", "B-roll", "Renders"])
    copy_script(source_script, os.path.join(project_path, "Footage", "B-roll"))
    create_shortcut(project_path, shortcut_directory)
    print(
        f"\n✅ Folder structure created successfully inside '{project_name}'!\n")
    break
