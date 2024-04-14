#!/bin/zsh

julia << EOF
	import Pkg
	pkgs = ["OhMyREPL", "Revise", "CodeTracking", "PkgTemplates"]
	Pkg.add(pkgs)
EOF

mkdir -p $HOME/.julia/config
julia --project=$HOME/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
