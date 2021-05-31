pkgs = ["OhMyREPL", "Revise", "StaticLint"]

using Pkg
for package in pkgs
    Pkg.add(package)
end
