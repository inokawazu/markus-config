#!/bin/bash
echo "This is my setup script, it is designed to install all of my, Markus Amano's, presets."

# Downloads the vim-plug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Makes the vim plug dir if it does not exist.
PLUGGED_DIR=~/.vim/plugged

if [ -d "$PLUGGED_DIR" ]; then
	mkdir "$PLUGGED_DIR"
fi

#Downloads the .vimrc file
rm ~/.vimrc
curl -fLo ~/.vimrc https://raw.githubusercontent.com/mgarbiso/markus-config/main/.vimrc
