import os

project_name = input('Enter project folder name ("H" for help): ')
print("Folder name is: " + project_name)

# Create the folder
if not os.path.exists(project_name):
    os.makedirs(project_name)
    print(f"📁 Folder created: {project_name}")
else:
    print(f"⚠️ Folder already exists: {project_name}")
