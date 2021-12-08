source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins with oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle common-aliases

# external plugins
antigen bundle unixorn/git-extra-commands
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# theme
antigen theme aussiegeek

# apply config
antigen apply

# make vim the defaul editor
EDITOR=$(which vim)

# append .local/bin to the path
PATH="$HOME"/.local/bin:$PATH

# custom aliases 
alias open="xdg-open"
alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3"
alias wsf="wolframscript -f"
alias alig="alias | grep"
alias tat="tmux attach -t"
alias tns="tmux new -s"
alias tl=' tmux ls'
alias vm='set -o vi'
alias j='julia'
alias jp='julia --project'
alias jpt='julia --project -t auto'
alias pluto='julia --project -e "using Pluto; Pluto.run()"'

# modern linux 
lsd --version >/dev/null 2>&1 && alias ls="lsd"
rg --version >/dev/null 2>&1 && alias grep="rg"
bat --version >/dev/null 2>&1 && alias cat="bat"
