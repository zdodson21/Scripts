#!/bin/bash

if [ -z $1 ]; then echo "Missing starting number (argument1)"; exit 1; fi
if [ -z $2 ]; then echo "Missing finishing number (argument2)"; exit 1; fi

if [[ ("$1" =~ ^[0-9]+$ && "$1" -ge 0) && ("$2" =~ ^[0-9]+$ && "$2" -gt $1) ]]; then
  # Remove default Welcome.md file
  rm "Welcome.md"
  
  # Create chapter / section directories
  for i in {$1..$2}; do
    local dir_name="$i. Chapter $i"
    
    mkdir $dir_name
    echo "Created directory: \"$dir_name\" ($i out of $2)"
  done

  # Create extra files
  extra_files=(
    "Definitions"\
    "Important Links"\
    "Symbol Codes"\
  )

  for file in $extra_files; do
    local file_name="$file.md"
    
    touch $file_name
    echo "Created file: \"$file_name\""
  done

  # Populate Symbol Codes.md file
  echo "For Linux, press \`CTRL + Shift + U\` to start typing unicode inputs.
  
| Symbol | Name              | Code   |
| ------ | ----------------- | ------ |
| \$Σ$    | Sigma (uppercase) | \`03a3\` |" > "Symbol Codes.md"
else
  exit 1
fi
