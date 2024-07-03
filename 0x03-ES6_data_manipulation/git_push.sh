#!/bin/bash

# Directory of your project
PROJECT_DIR="/home/yvesmfura/alx-frontend-javascript/0x03-ES6_data_manipulation"

# Change to the project directory
cd "$PROJECT_DIR" || { echo "Directory not found! Exiting."; exit 1; }

# Add all files to git staging area
git add .

# Array of commit messages based on tasks
declare -A commit_messages
commit_messages["0-get_list_students.js"]="Created function to return a basic list of student objects."
commit_messages["1-get_list_student_ids.js"]="Created function to return an array of student IDs."
commit_messages["2-get_students_by_loc.js"]="Created function to filter students by location."
commit_messages["3-get_ids_sum.js"]="Created function to return the sum of student IDs."
commit_messages["4-update_grade_by_city.js"]="Created function to update student grades by city."
commit_messages["5-typed_arrays.js"]="Created function to handle Int8 typed arrays."
commit_messages["6-set.js"]="Created function to convert array to set."
commit_messages["7-has_array_values.js"]="Created function to check if array values exist in set."
commit_messages["8-clean_set.js"]="Created function to clean set values starting with specific string."
commit_messages["9-groceries_list.js"]="Created function to return a map of grocery items."
commit_messages["10-update_uniq_items.js"]="Created function to update unique items in a map."
commit_messages["100-weak.js"]="Created WeakMap instance and function to track API query counts."

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

