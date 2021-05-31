pkgs = ["OhMyREPL", "Revise"]

using Pkg
for package in pkgs
    Pkg.add(package)
end
