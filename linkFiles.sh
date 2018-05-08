#!/bin/bash

## Link all files to home.

this_dir=$(pwd)
GLOBIGNORE=".:.."

for file in .*; do
  if [[ "$file" != ".git" ]]; then
    echo "Linking $file."
    ln -s "$this_dir/$file" "$HOME"
  fi
done
