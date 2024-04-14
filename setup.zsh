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
    if read -q "reply?Would you like to set up antigen? (y/n): "
        curl -sfL git.io/antigen > ~/.antigen.zsh
    end

    echo
    for zsh_file in antigen.zsh aliases.zsh env_variables.zsh key_bindings.zsh
    do
        install_zsh_source_file $zsh_file ~/.zshrc
    done
fi
echo
echo

# sourcing vim
install_source_file vim_settings.vim ~/.vimrc "source %s"

#Add tmux config file
install_source_file tmux.conf ~/.tmux.conf "source %s"

# julia 
install_source_file startup.jl ~/.julia/config/startup.jl 'include("%s")'

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
