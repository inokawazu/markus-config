using Pkg: Pkg # Hack for Julia 1.11 release: https://github.com/KristofferC/OhMyREPL.jl/issues/345
atreplinit() do repl
    try
        @eval using OhMyREPL
    catch e
        @warn "error while importing OhMyREPL" e
    end
end
