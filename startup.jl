atreplinit() do repl
    try
        @eval begin 
            using Revise
            using OhMyREPL
            enable_autocomplete_brackets(false)
        end
    catch e
        @warn "error while importing OhMyREPL and Revise" e
    end
end
