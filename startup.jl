using OhMyREPL
using Revise
using CodeTracking

enable_autocomplete_brackets(false)

function mytemplate()
    @eval begin
        using PkgTemplates
        Template(dir = ".", user = "inokawazu")
    end
end
