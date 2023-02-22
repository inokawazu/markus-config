#!/bin/env bash

#strict mode
set -euo pipefail

#variables
REALNAME='Markus-Amano'
CONTACTEMAIL="markus.a.amano@gmail.com"
GITHUBUSERNAME="inokawazu"
REPONAME="markus-config"
SCRIPT_DIR=$(dirname -- $(readlink -fn -- "$0"))

#Functions
#Notifyset function prints what was set to what. 
notifyset () {
    echo The $1 was set to $2.
}

saveconfigfile () {
    ln -sf $SCRIPT_DIR/$1 $2
}


#Optional
HELP_STRING="
usage: ./setup.sh -j

options:
    j   installs/updates Julia packages and startup.jl
"

#Sets julia configuration
setupjulia(){
    julia --version 2>&1 >/dev/null
    JULIA_IS_AVAILABLE=$?
    if [ $JULIA_IS_AVAILABLE -eq 0 ]; then
        # cp installjuliapkgs.jl /tmp
        julia --startup-file=no $SCRIPT_DIR/installjuliapkgs.jl
        mkdir -p $HOME/.julia/config
        saveconfigfile startup.jl $HOME/.julia/config/startup.jl
        echo "INSTALLED: julia packages"
    fi
}

while getopts "jh" option; do
   case $option in
      j) setupjulia;;
      h) echo $HELP_STRING
          exit;;
      \?) echo $HELP_STRING
          exit;;
   esac
done

#MAIN

# Makes the vim plug dir if it does not exist.
mkdir -p $HOME/.vim/plugged

#vim
saveconfigfile vimrc $HOME/.vimrc
echo "INSTALLED: vimrc"

#nvim
mkdir -p ~/.config/nvim/
saveconfigfile init.vim $HOME/.config/nvim/init.vim
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
python3 --version 2>&1 >/dev/null && python3 -m pip install --user --upgrade pynvim
echo "Installed nvim stuff"


#checks if zsh is install
zsh --version 2>&1 >/dev/null
ZSH_IS_AVAILABLE=$?
if [ $ZSH_IS_AVAILABLE -ne 1 ]; then
    #Downloads antigen to download all the cool zsh plugins.
    curl -sfL git.io/antigen > ~/.antigen.zsh
    if [ -f "~/.zshrc" ]; then
        rm "~/.zshrc"
    fi
    saveconfigfile zshrc $HOME/.zshrc
    echo "INSTALLED: .zshrc"
else
    echo "zsh is not installed on this machine (please install or contact your system admin)."
fi

#Sets git configuration
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
    git config --global user.name $REALNAME
    notifyset "Git name" $REALNAME
    git config --global user.email $CONTACTEMAIL
    notifyset "Git email" $CONTACTEMAIL
    git config --global core.editor nvim
    notifyset "Git editor" "nvim"
    git config --global github.user $GITHUBUSERNAME
    notifyset "Github username" $GITHUBUSERNAME
fi

#Add tmux config file
saveconfigfile tmux.conf $HOME/.tmux.conf
