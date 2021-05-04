packages=["OhMyREPL","Revise"]

using Pkg
for package in packages
	Pkg.add(package)
end
