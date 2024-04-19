#!/bin/env zsh

PATH_DIR="$HOME/.local/bin/"
mkdir -p "$PATH_DIR"
curl https://cht.sh/:cht.sh > "$PATH_DIR/cht.sh"
chmod +x "$PATH_DIR/cht.sh"

SHELL_NAME=$(basename $SHELL)
if [[ $SHELL_NAME = zsh ]]
then
  mkdir -p ~/.zsh.d
  curl https://cheat.sh/:zsh > ~/.zsh.d/_cht
  echo 'fpath=(~/.zsh.d/ $fpath)' >> ~/.zshrc
fi
