using Pkg: Pkg # Hack for Julia 1.11 release: https://github.com/KristofferC/OhMyREPL.jl/issues/345
atreplinit() do repl
    try
        @eval begin 
            using OhMyREPL
            enable_autocomplete_brackets(false)
        end
    catch e
        @warn "error while importing OhMyREPL" e
    end
end

try
    @eval using Revise
catch e
    @warn "error while importing Revise" e
end
