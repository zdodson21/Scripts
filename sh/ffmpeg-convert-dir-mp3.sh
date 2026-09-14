#!/bin/bash

# Run this script within a folder directory containing the files you wish to convert.

type=""

if [ -z $1 ]; then 
  read -p "Missing file type (arguement1). Convert all files? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1;
else
  type=$1
fi

output_dir="output"

make_output_dir() {
  mkdir $output_dir &> /dev/null

  local err_code=$?

  # Simple solution, not intended for large scale. 
  # Simply meant to provide an output directory if name is taken.

  new_dir=$output_dir

  if [[ $err_code -eq 1 ]]; then
    n=1
    new_dir=""
    
    while [[ $err_code -eq 1 ]]
    do
      new_dir=$output_dir$n
      mkdir $new_dir &> /dev/null
      err_code=$?
      n=$((n+1))
    done

    output_dir=$new_dir
  fi
}

convert_files() {
  local script_name=$(basename "$0")

  for file in * 
  do
    if [[ $file != $script_name && -f $file ]]; then
      local filename="${file%.*}"
      # TODO if file name has spaces there are problems
      local extension="${file##*.}"

      local can_convert=false

      if [[ -z $type || (-n $type && $type == $extension)]]; then
        can_convert=true
      fi

      if [[ $can_convert = true ]]; then
        # https://stackoverflow.com/questions/37367841/bash-how-to-add-space-in-string
        ffmpeg -i "${file// /\ }" -ab 320k -map_metadata 0 -id3v2_version 3 $output_dir/"${filename// /\ }.mp3"
      fi
    fi
  done
}

main() {
  make_output_dir
  convert_files
}

main
