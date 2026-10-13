# open editor with Alt-e edit command line in editor

if [[ -v EDITOR ]]; then
    bindkey '^[e' edit-command-line
    zstyle :zle:edit-command-line editor $EDITOR -f
fi

