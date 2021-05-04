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
antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# theme
antigen theme blinks

# apply config
antigen apply
