atreplinit() do repl
    try
        @eval begin 
            using Revise
            using OhMyREPL
            enable_autocomplete_brackets(false)
        end
    catch e
        @warn "error while importing OhMyREPL" e
    end
end
