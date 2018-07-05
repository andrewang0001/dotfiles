#!/bin/bash

## Link all files to home.
CMD="$1"

this_dir=$(pwd)
GLOBIGNORE=".:.."
dotfiles=(.emacs .vimrc .Xdefaults)
dotfiles_config=(i3 i3status dunst)

install() {

  ## Begin with the files that belong in ~/
  for f in ${dotfiles[@]}; do
    if [[ -f $HOME/$f ]]; then
      echo "$HOME/$f exists! Deleting."
      rm -rf "$HOME/$f"
    fi
    echo "ln -s $this_dir/$f $HOME/$f"
    ln -s "$this_dir/$f" "$HOME/$f"
  done

  ## Now also do the files that belong in ~/.config
  mkdir -p "$HOME/.config"
  for f in ${dotfiles_config[@]}; do
    if [[ -f $HOME/.config/$f ]]; then
      echo "$HOME/.config/$f exists! Deleting."
      echo "rm -rf "$HOME/.config/$f""
    fi
    echo "ln -s $this_dir/.config/$f $HOME/.config/$f"
    ln -s $this_dir/.config/$f $HOME/.config/$f
  done
}

print_help() {
  prog=$(basename "$0")
  echo "Usage: $prog [-option]"
  echo "--help: print this message"
  echo "-i:     install dotfiles"
}

case "$CMD" in
  --help)
    print_help
    exit 0
    ;;
      -i)
    install
    exit 0
    ;;
    *)
    print_help
    exit 1
    ;;
esac
install
