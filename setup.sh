#!/bin/bash
echo "This is my setup script, it is designed to install all of my, Markus Amano's, presets."

# Makes the vim plug dir if it does not exist.
mkdir -p ~/.vim/plugged

# Makes the colors folder.
mkdir -p ~/.vim/colors

# Downloads the themes for vim.
curl -sfLo ~/.vim/colors/jellybeans.vim https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim


#Downloads the .vimrc file
rm ~/.vimrc
curl -sfLo ~/.vimrc https://raw.githubusercontent.com/mgarbiso/markus-config/main/.vimrc
