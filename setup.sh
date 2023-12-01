#!/bin/env bash

#strict mode
set -euo pipefail

DISTRO=$(cat /etc/*-release | grep '^ID=' | cut -d'=' -f2)

#variables
REALNAME='Markus-Amano'
CONTACTEMAIL="markus.a.amano@gmail.com"
GITHUBUSERNAME="inokawazu"
REPONAME="markus-config"
SCRIPT_DIR=$(dirname -- $(readlink -fn -- "$0"))

EDITOR="nvim"
if [[ -x nvim ]]
then 
    EDITOR="nvim"
elif [[ -x vim ]]
then
    EDITOR="vim"
fi

#Functions
#Notifyset function prints what was set to what. 
notifyset () {
    echo The $1 was set to $2.
}

saveconfigfile () {
    cp $SCRIPT_DIR/$1 $2
}

saveconfigdir () {
    cp -r $SCRIPT_DIR/$1 $2
}


#Optional
HELP_STRING="
usage: ./setup.sh -j

options:
    j   installs/updates Julia packages and startup.jl
"

#Sets julia configuration
setupjulia(){
    which julia 2>&1 >/dev/null
    JULIA_IS_AVAILABLE=$?
    if [ $JULIA_IS_AVAILABLE -eq 0 ]; then
        # cp installjuliapkgs.jl /tmp
        julia --startup-file=no $SCRIPT_DIR/julia/installjuliapkgs.jl
        mkdir -p $HOME/.julia/config
        saveconfigfile julia/startup.jl $HOME/.julia/config/startup.jl
        julia --project=$HOME/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
        echo "INSTALLED: julia packages"
    fi
}

setupnvim(){
    sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    case $DISTRO in
        "ubuntu" | "debian")
            sudo apt update && sudo apt install python3-neovim -y
            ;;
        "fedora")
            sudo dnf install python3-neovim -y
            ;;
        "arch" | "manjaro" )
            sudo pacman -Syu python-neovim
            ;;
        *)
            echo "Unsupported distribution for python-neovim installation: $DISTRO"
            ;;
    esac
    echo "Installed nvim python stuff"
}

while getopts "jhn" option; do
   case $option in
      j) setupjulia
          ;;
      n) setupnvim
          ;;
      h | \?) echo $HELP_STRING
          exit;;
   esac
done

#MAIN

# nvim
mkdir -p $HOME/.config/nvim
saveconfigdir nvim $HOME/.config

# Makes the vim plug dir if it does not exist.
mkdir -p $HOME/.vim/plugged

#vim
saveconfigfile .vimrc $HOME/.vimrc
echo "INSTALLED: vimrc"

#checks if zsh is install
which zsh 2>&1 >/dev/null
ZSH_IS_AVAILABLE=$?
if [ $ZSH_IS_AVAILABLE -ne 1 ]; then
    #Downloads antigen to download all the cool zsh plugins.
    curl -sfL git.io/antigen > ~/.antigen.zsh
    if [ -f "~/.zshrc" ]; then
        rm "~/.zshrc"
    fi
    saveconfigfile .zshrc $HOME/.zshrc
    echo "INSTALLED: .zshrc"
else
    echo "zsh is not installed on this machine (please install or contact your system admin)."
fi

#Sets git configuration
which git 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
    git config --global user.name $REALNAME
    notifyset "Git name" $REALNAME
    git config --global user.email $CONTACTEMAIL
    notifyset "Git email" $CONTACTEMAIL
    git config --global core.editor $EDITOR
    notifyset "Git editor" "nvim"
    git config --global github.user $GITHUBUSERNAME
    notifyset "Github username" $GITHUBUSERNAME
fi

#Add tmux config file
saveconfigfile .tmux.conf $HOME/.tmux.conf
