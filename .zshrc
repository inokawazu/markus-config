source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle zsh-users/zsh-completions

# plugins from oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle qrcode

# external plugins
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle unixorn/autoupdate-antigen.zshplugin
# antigen bundle zsh-users/zsh-autosuggestions

antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# theme
antigen theme gianu

antigen apply

# END antigen

# open editor with Alt-e edit command line in editor
bindkey '^[e' edit-command-line

# make vim the defaul editor
EDITOR="vi"
if [[ -x nvim ]]
then 
  EDITOR="nvim"
elif [[ -x vim ]]
then
  EDITOR="vim"
fi

# append .local/bin to the path
PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/Scripts:$PATH

# open = xdg
alias open="xdg-open"

alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3"

# wolframscript so one can run wsf file.wl
alias wsf="wolframscript -f"

# grep through all aliases
alias alig="alias | grep"

# tmux aliases
alias tat="tmux attach -t"
alias tns="tmux new -s"
alias tl="tmux ls"

# zsh vim bindings
alias vm="set -o vi"

# julia aliases
alias j="julia"
alias jp="julia --project"
alias jtest="julia --project -e 'using Pkg; Pkg.test()'"
alias jsc="julia --startup-file=no" # short for "julia script"
alias pluto='JULIA_NUM_THREADS=auto julia --startup-file=no --project -e "using Pluto; Pluto.run(auto_reload_from_file=true)"'

# language aliases
alias jlookup='python -m jamdict lookup'

# modern linux 
lsd --version >/dev/null 2>&1 && alias ls="lsd"
rg --version >/dev/null 2>&1 && alias grep="rg"
bat --version >/dev/null 2>&1 && alias cat="bat"

# file with -S
which file >/dev/null 2>&1 && alias file="file -S"

# custom commands
alias getip='echo $( curl -s "https://api.myip.com" )'

# media playback
mpv --version >/dev/null 2>&1 && alias mpa="mpv --no-video"
nvim --version >/dev/null 2>&1 && alias vim="nvim"

# use the kitty version of ssh
if [[ -n $KITTY_WINDOW_ID ]]; then
  alias ssh="kitten ssh"
fi

# julia settings
export JULIA_NUM_THREADS=4
PATH=$HOME/.juliaup/bin:$PATH
export PATH
