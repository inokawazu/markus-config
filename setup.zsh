#!/bin/env zsh

#strict mode
set -euo pipefail

SCRIPT_DIR=$(dirname -- $(readlink -fn -- "$0"))

install_source_file() {
    # arguments: source_file target_file template
    source_file=$1
    shift
    target_file=$1
    shift
    template=$1

    if read -q "reply?Would you like to install $source_file to $target_file (y/n): "
    then
        echo "\n Installed $source_file to $target_file"
        printf "$template\n" $SCRIPT_DIR/$source_file >> $target_file
    else
        echo
        echo
    fi
}

install_zsh_source_file() {
    install_source_file $1 $2 "source %s"
}

if read -q "reply?Would you like to set up zsh files? (y/n): "
then
    echo
    for zsh_file in antigen.zsh aliases.zsh env_variables.zsh key_bindings.zsh
    do
        install_zsh_source_file $zsh_file ~/.zshrc
    done
fi
echo
echo

install_source_file vim_settings.vim ~/.vimrc "source %s"

#setupnvim(){
#    sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#    case $DISTRO in
#        "ubuntu" | "debian")
#            sudo apt update && sudo apt install python3-neovim -y
#            ;;
#        "fedora")
#            sudo dnf install python3-neovim -y
#            ;;
#        "arch" | "manjaro" )
#            sudo pacman -Syu python-neovim
#            ;;
#        *)
#            echo "Unsupported distribution for python-neovim installation: $DISTRO"
#            ;;
#    esac
#    echo "Installed nvim python stuff"
#}

##Sets julia configuration
#setupjulia(){
#    which julia 2>&1 >/dev/null
#    JULIA_IS_AVAILABLE=$?
#    if [ $JULIA_IS_AVAILABLE -eq 0 ]; then
#        # cp installjuliapkgs.jl /tmp
#        julia --startup-file=no $SCRIPT_DIR/julia/installjuliapkgs.jl
#        mkdir -p $HOME/.julia/config
#        saveconfigfile julia/startup.jl $HOME/.julia/config/startup.jl
#        julia --project=$HOME/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
#        echo "INSTALLED: julia packages"
#    fi
#}

#while getopts "jhn" option; do
#   case $option in
#      j) setupjulia
#          ;;
#      n) setupnvim
#          ;;
#      h | \?) echo $HELP_STRING
#          exit;;
#   esac
#done

##MAIN

## nvim
#mkdir -p $HOME/.config/nvim
#saveconfigdir nvim $HOME/.config

## Makes the vim plug dir if it does not exist.
#mkdir -p $HOME/.vim/plugged

##vim
#saveconfigfile .vimrc $HOME/.vimrc
#echo "INSTALLED: vimrc"

##checks if zsh is install
#which zsh 2>&1 >/dev/null
#ZSH_IS_AVAILABLE=$?
#if [ $ZSH_IS_AVAILABLE -ne 1 ]; then
#    #Downloads antigen to download all the cool zsh plugins.
#    curl -sfL git.io/antigen > ~/.antigen.zsh
#    if [ -f "~/.zshrc" ]; then
#        rm "~/.zshrc"
#    fi
#    saveconfigfile .zshrc $HOME/.zshrc
#    echo "INSTALLED: .zshrc"
#else
#    echo "zsh is not installed on this machine (please install or contact your system admin)."
#fi

##Sets git configuration
#which git 2>&1 >/dev/null
#GIT_IS_AVAILABLE=$?
#if [ $GIT_IS_AVAILABLE -eq 0 ]; then
#    git config --global user.name "$REALNAME"
#    notifyset "Git name" "$REALNAME"
#    git config --global user.email $CONTACTEMAIL
#    notifyset "Git email" $CONTACTEMAIL
#    git config --global core.editor $EDITOR
#    notifyset "Git editor" "nvim"
#    git config --global github.user $GITHUBUSERNAME
#    notifyset "Github username" $GITHUBUSERNAME
#fi

##Add tmux config file
#saveconfigfile .tmux.conf $HOME/.tmux.conf
