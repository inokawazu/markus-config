using Pkg: Pkg # Hack for Julia 1.11 release: https://github.com/KristofferC/OhMyREPL.jl/issues/345
atreplinit() do repl
    @eval begin 
        using Revise
        using OhMyREPL
        enable_autocomplete_brackets(false)
    end
end
