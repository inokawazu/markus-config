#!/bin/bash
echo "This is my setup script, it is designed to install all of my presets."

#variables
REALNAME="Markus Amano"
CONTACTEMAIL="markus.a.amano@gmail.com"

#Notifyset function prints what was set to what. 
notifyset () {
    echo The $1 was set to $2.
}

# Makes the vim plug dir if it does not exist.
mkdir -p ~/.vim/plugged

# Makes the colors folder.
mkdir -p ~/.vim/colors

# Downloads the themes for vim.
curl -sfLo ~/.vim/colors/jellybeans.vim https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

echo "INSTALLED: colors"

#Downloads the .vimrc file
if [ -f "~/.vimrc" ]; then
    rm "~/.vimrc"
fi
curl -sfLo ~/.vimrc https://raw.githubusercontent.com/mgarbiso/markus-config/main/.vimrc
echo "INSTALLED: .vimrc"

#Sets git configuration
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
    git config --global user.name $REALNAME
    notifyset "Git name" $REALNAME
    git config --global user.email $CONTACTEMAIL
    notifyset "Git email" $CONTACTEMAIL
    git config --global core.editor vim
    notifyset "Git editor" "vim"
fi
