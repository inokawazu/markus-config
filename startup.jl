atreplinit() do repl
    if hasfield(typeof(repl.options), :auto_insert_closing_bracket)
        repl.options.auto_insert_closing_bracket = false
    end
end

try
    @eval using Revise
catch e
    @warn "error while importing Revise" e
end
