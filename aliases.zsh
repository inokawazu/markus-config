is_command() { type $1 &> /dev/null }

# open = xdg
alias open="xdg-open"

# wolframscript so one can run wsf file.wl
alias wsf="wolframscript -f"

# grep through all aliases
alias alig="alias | grep"

# tmux aliases
alias tat="tmux attach -t"
alias tns="tmux new -s"
alias tl="tmux ls"

# julia aliases
alias j="julia"
alias jp="julia --project"
alias jtest="julia --project -e 'using Pkg; Pkg.test()'"
alias jsc="julia --startup-file=no" # short for "julia script"
alias pluto='JULIA_NUM_THREADS=auto julia --startup-file=no --project -e "using Pluto; Pluto.run(auto_reload_from_file=true)"'

# language aliases
alias jlookup='python -m jamdict lookup'

# modern linux 
is_command lsd && alias ls="lsd"
is_command rg && alias grep="rg"
is_command bat && alias cat="bat"

# more compatible
alias file="file -S"

# get ip 
alias getip='echo $( curl -s "https://api.myip.com" )'

# media playback
alias mpa="mpv --no-video"
alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3"

# vim is old
is_command nvim && alias vim="nvim"

# use the kitty version of ssh
if [[ -n $KITTY_WINDOW_ID ]]; then
  alias ssh="kitten ssh"
fi

