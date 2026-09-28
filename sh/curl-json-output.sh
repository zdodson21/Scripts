#!/bin/bash

# Input a URL and get a "prettified JSON output" 

if [ -z $1 ]; then
  echo "Missing URL"; exit 1;
else
  URL=$1
fi

verify_url() {
  if [[ ! $URL =~ \.json$ ]]; then
    echo "URL does not end with \".json\"!"; exit 2;
  fi
}

main() {  
  verify_url
  curl -s $URL | jq
}

main
