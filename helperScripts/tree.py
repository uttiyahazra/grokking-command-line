import os

def generate_tree(root_dir, prefix=""):
    entries = sorted(os.listdir(root_dir))
    for index, entry in enumerate(entries):
        path = os.path.join(root_dir, entry)
        # Skip .git folder
        if entry == ".git":
            continue
        connector = "└── " if index == len(entries) - 1 else "├── "
        print(prefix + connector + entry)
        if os.path.isdir(path):
            extension = "    " if index == len(entries) - 1 else "│   "
            generate_tree(path, prefix + extension)

if __name__ == "__main__":
    generate_tree(".")
