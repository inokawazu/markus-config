#!/bin/bash
echo "This is my setup script, it is designed to install all of my presets."

#variables
REALNAME="Markus Amano"
CONTACTEMAIL="markus.a.amano@gmail.com"
GITHUBUSERNAME="inokawazu"
REPONAME="markus-config"
SCRIPT_DIR=$(dirname -- $(readlink -fn -- "$0"))

#Notifyset function prints what was set to what. 
notifyset () {
    echo The $1 was set to $2.
}

saveconfigfile () {
    cp $SCRIPT_DIR/$1 $2/$1 $3
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
saveconfigfile .vimrc ~
echo "INSTALLED: .vimrc"

#checks if zsh is install
zsh --version 2>&1 >/dev/null
ZSH_IS_AVAILABLE=$?
if [ $ZSH_IS_AVAILABLE -neq 0 ]; then
    #Downloads antigen to download all the cool zsh plugins.
    curl -sfL git.io/antigen > ~/.antigen.zsh
    if [ -f "~/.zshrc" ]; then
        rm "~/.zshrc"
    fi
    saveconfigfile .zshrc ~
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
    git config --global core.editor vim
    notifyset "Git editor" "vim"
    git config --global github.user $GITHUBUSERNAME
    notifyset "Github username" $GITHUBUSERNAME
fi

#Sets julia configuration
julia --version 2>&1 >/dev/null
JULIA_IS_AVAILABLE=$?
if [ $JULIA_IS_AVAILABLE -eq 0 ]; then
    saveconfigfile installjuliapkgs.jl /tmp
    julia /tmp/installjuliapkgs.jl
    mkdir -p ~/.julia/config
    saveconfigfile startup.jl ~/.julia/config
    echo "INSTALLED: julia"
fi
