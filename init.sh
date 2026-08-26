#!/bin/bash

# Check if a folder name was provided
if [ -z "$1" ]; then
  echo "Usage: ./init.sh <problem_folder_name>"
  exit 1
fi

TARGET_DIR="$1"

# Create the target directory and the tests subdirectory inside it
mkdir -p "$TARGET_DIR/tests"

# Optional: Create a blank C++ file to start with
touch "$TARGET_DIR/solution.cpp"

echo "Created folder: $TARGET_DIR"
echo "Created folder: $TARGET_DIR/tests"


