#!/bin/bash
set -e

# Define the path to the repository root directory
repo_root=$(dirname "$0")/..
cd "$repo_root"

# Define the output file relative to the repository root
output=README.md

# Clear the README.md file if it exists
[ -f "$output" ] && rm "$output"

echo "<body style=\"background: #181a1b; color: #e8e6e3\">\n\n" >> "$output"
# Loop through each numbered folder (e.g., 01. Contacts)
for dir in [0-9][0-9].*; do
    # Skip hidden folders or folders starting with a dot
    if [ -d "$dir" ] && [[ "$dir" != .* ]]; then
        # Loop through each markdown file in the current folder (e.g., 01.01 Infographics.md)
        for file in "$dir"/*.md; do
            # Append the content of the markdown file to README.md
            cat "$file" >> "$output"
            # Add two newlines to ensure proper separation
            echo -e "\n\n" >> "$output"
        done
    fi
done
echo "</body>" >> "$output"
echo "README.md has been generated."