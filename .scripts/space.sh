#!/bin/bash

# Function to display size in human-readable format
function display_size {
  local item=$1
  
  if [ -d "$item" ]; then
    # If the item is a directory
    echo "Directory size:"
    du -sh "$item" | cut -f1
  elif [ -f "$item" ]; then
    # If the item is a file
    echo "File size:"
    stat --printf="%s\n" "$item" | numfmt --to=iec
  else
    echo "Error: \"$item\" is not a valid file or directory."
  fi
}

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file_or_directory>"
    exit 1
fi

display_size "$1"
