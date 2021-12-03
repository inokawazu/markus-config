pkgs = ["OhMyREPL", "Revise", "Pluto", "JET"]

using Pkg
Pkg.add(pkgs)

pkg"add LanguageServer#master"
pkg"add StaticLint#master"
pkg"add SymbolServer#master"
