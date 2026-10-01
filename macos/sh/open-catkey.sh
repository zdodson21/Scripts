#!/bin/bash

# This script is just a quick link opener to navigate to specific items within the Penn State University Library Catalog.
# Honestly, I just wanted a terminal shortcut for this one :/

# alias catkey='bash ~/Scripts/macos/sh/open-catkey.sh'
# alias ckey='catkey'

catalog_url="https://catalog.libraries.psu.edu/catalog/"
marc_download_dir=~/Downloads

help() {
  echo ""
  echo "open-catkey.sh CATKEY# OPTION"
  echo ""
  echo "Options:"
  echo "  <leave blank> - go to library catalog website."
  echo "  json - navigate to raw.json page."
  echo "  marc - download marc file."
  echo "  view - open marc view on library catalog website."
  echo "  help - view this text."
  echo "  options - view this text."
  echo ""
  echo "The \`help\` and \`options\` strings can be used instead of \`CATKEY#\` as well"
  echo ""

  exit 0
}

if [ -z $1 ]; then
  echo "Missing key!"; exit 1;
elif [[ $1 == "help" || $1 == "options" ]]; then
  help
else
  key=$1
fi

end_substring=""

if [ $2 ]; then
  if [[ $2 == "json" ]]; then
    end_substring="/raw.json"
  elif [[ $2 == "marc" ]]; then    
    wget -P $marc_download_dir $catalog_url$key.marc; exit 0;
  elif [[ $2 == "view" ]]; then
    end_substring="/marc_view"
  elif [[ $2 == "help" || $2 == "options" ]]; then
    help
  fi
fi

main() {
  open $catalog_url$key$end_substring
}

main
