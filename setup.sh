#!/bin/bash
echo "This is my setup script, it is designed to install all of my presets."

#variables
REALNAME="Markus Amano"
CONTACTEMAIL="markus.a.amano@gmail.com"
GITHUBUSERNAME="inokawazu"
REPONAME="markus-config"

#Notifyset function prints what was set to what. 
notifyset () {
    echo The $1 was set to $2.
}

saveconfigfile () {
    curl -sfLo $2/$1 https://raw.githubusercontent.com/$GITHUBUSERNAME/$REPONAME/main/$1
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

#Downloads antigen to download all the cool zsh plugins.
curl -sfL git.io/antigen > ~/.antigen.zsh
if [ -f "~/.zshrc" ]; then
    rm "~/.zshrc"
fi
saveconfigfile .zshrc ~
echo "INSTALLED: .zshrc"

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
    julia -E $(curl -s https://raw.githubusercontent.com/$GITHUBUSERNAME/$REPONAME/main/installjuliapkgs.jl) 
    mkdir -p ~/.julia/config
    saveconfigfile startup.jl ~/.julia/config
    echo "INSTALLED: julia"
fi
