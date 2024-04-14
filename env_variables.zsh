is_command() { type $1 &> /dev/null }

export NAME="Markus Amano"
export EMAIL="markus.a.amano@gmail.com"

export GIT_AUTHOR_NAME="$NAME"
export GIT_AUTHOR_EMAIL="$EMAIL"
export GIT_COMMITTER_NAME="$NAME"
export GIT_COMMITTER_EMAIL="$EMAIL"

export DISTRO="$(cat /etc/*-release | grep '^ID=' | cut -d'=' -f2)"

export EDITOR=""
if is_command nvim
then 
    EDITOR="nvim"
elif is_command vim
then
    EDITOR="vim"
fi

# append .local/bin to the path
export PATH=$HOME/.local/bin:$PATH
PATH=$HOME/Scripts:$PATH

# julia env variables
export JULIA_NUM_THREADS=4
