#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Navigate to the specified directory
DIRECTORY="$1"
cd "$DIRECTORY" || { echo "Directory not found"; exit 1; }

# Find all unique file extensions in the directory
for file in *.*; do
  # Skip if it's not a file
  if [ ! -f "$file" ]; then
    continue
  fi

  # Extract the file extension
  extension="${file##*.}"

  # Create a directory for the extension if it doesn't exist
  if [ ! -d "$extension" ]; then
    mkdir "$extension"
  fi

  # Move the file to its respective directory
  mv "$file" "$extension/"
done

echo "Files have been organized by extension."
