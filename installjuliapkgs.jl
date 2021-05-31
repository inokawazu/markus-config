pkgs = ["OhMyREPL", "Revise", "Pluto"]

using Pkg
for package in pkgs
    Pkg.add(package)
end
