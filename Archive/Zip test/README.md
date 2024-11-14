### **Goal:**
The script is designed to:
1. **Extract** `.zip` files in the current directory using 7-Zip.
2. **Move** the folder inside the extracted zip to the parent directory.
3. **Optionally, delete** the `.zip` files after extraction.
  
**Before:** 

├── Folder.zip
       └── Subfolder 
            └── john.txt 

**After Script**
├── Subfolder
     └── john.txt