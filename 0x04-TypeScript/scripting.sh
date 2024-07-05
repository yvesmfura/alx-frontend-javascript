#!/bin/bash

# Set the project directory
PROJECT_DIR="/home/yvesmfura/alx-frontend-javascript/0x04-TypeScript"

# Change to the project directory
cd "$PROJECT_DIR" || { echo "Directory not found! Exiting."; exit 1; }

# Add all files to the git staging area
git add .

# Array of commit messages based on tasks
declare -A commit_messages=(
    ["task_0/js/main.ts"]="Completed Task 0: Creating an interface for a student"
    ["task_0/package.json"]="Added package.json for Task 0"
    ["task_0/.eslintrc.js"]="Added ESLint config for Task 0"
    ["task_0/tsconfig.json"]="Added TypeScript config for Task 0"
    ["task_0/webpack.config.js"]="Added Webpack config for Task 0"
    ["task_1/js/main.ts"]="Completed Task 1: Let's build a Teacher interface"
    ["task_1/package.json"]="Added package.json for Task 1"
    ["task_1/tsconfig.json"]="Added TypeScript config for Task 1"
    ["task_1/webpack.config.js"]="Added Webpack config for Task 1"
    ["task_2/js/main.ts"]="Completed Task 2: Extending the Teacher class"
    ["task_2/package.json"]="Added package.json for Task 2"
    ["task_2/tsconfig.json"]="Added TypeScript config for Task 2"
    ["task_2/webpack.config.js"]="Added Webpack config for Task 2"
    ["task_3/js/main.ts"]="Completed Task 3: Printing teachers"
    ["task_3/js/interface.ts"]="Added interface definitions for Task 3"
    ["task_3/js/crud.d.ts"]="Added TypeScript declarations for CRUD operations in Task 3"
    ["task_4/js/main.ts"]="Updated main.ts for Task 4: Namespace & Declaration merging"
    ["task_4/js/subjects/Cpp.ts"]="Added Cpp subject class for Task 4"
    ["task_4/js/subjects/Java.ts"]="Added Java subject class for Task 4"
    ["task_4/js/subjects/React.ts"]="Added React subject class for Task 4"
    ["task_4/js/subjects/Subject.ts"]="Added Subject class for Task 4"
    ["task_4/js/subjects/Teacher.ts"]="Added Teacher interface for Task 4"
    ["task_5/js/main.ts"]="Completed Task 5: Brand convention & Nominal typing"
    ["task_5/package.json"]="Added package.json for Task 5"
    ["task_5/webpack.config.js"]="Added Webpack config for Task 5"
    ["task_5/tsconfig.json"]="Added TypeScript config for Task 5"
)

# Print staged files for debugging
echo "Staged files:"
git diff --cached --name-only

# Iterate over staged files and commit with appropriate messages
for file in $(git diff --cached --name-only); do
    # Remove the directory prefix for committing
    filename=$(basename "$file")
    echo "Processing file: $filename"  # Debug output to track file processing
    if [[ -n "${commit_messages[$filename]}" ]]; then
        echo "Committing $filename with message: ${commit_messages[$filename]}"
        git commit -m "${commit_messages[$filename]}" -- "$filename"
    else
        echo "Committing $filename with generic message."
        git commit -m "Updated file: $filename" -- "$filename"
    fi
done

# Push changes to the remote repository on the main branch
git push origin main

