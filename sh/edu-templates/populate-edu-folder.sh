#!/bin/bash

make_directories() {
  directories=(
    "assignments" \
    "extra" \
    "notes" \
    "projects" \
  )

  for dir in $directories; do
    mkdir $dir
    echo "Created $dir directory..."
  done
}

# Call functions
make_directories
