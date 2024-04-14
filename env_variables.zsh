is_command() { type $1 &> /dev/null }

export REALNAME='Markus Amano'
export NAME='Markus Amano'
export CONTACTEMAIL="markus.a.amano@gmail.com"
export GITHUBUSERNAME="inokawazu"

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
