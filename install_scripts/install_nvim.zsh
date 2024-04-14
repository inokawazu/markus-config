#!/bin/zsh

set -euo pipefail

export DISTRO="$(cat /etc/*-release | grep '^ID=' | cut -d'=' -f2)"

sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
case $DISTRO in
   "ubuntu" | "debian")
	   sudo apt update && sudo apt install nvim python3-neovim -y
	   ;;
   "fedora")
	   sudo dnf install nvim python3-neovim -y
	   ;;
   "arch" | "manjaro" )
	   sudo pacman -Syu nvim python-neovim
	   ;;
   *)
	   echo "Unsupported distribution for python-neovim installation: $DISTRO"
	   ;;
esac
