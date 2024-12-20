# Local Bin Path
export PATH=$PATH:$HOME/.local/bin

# Oh My Zsh Path
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="gentoo"

# Plugins
plugins=(git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Zsh Aliases
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"

# NeoVim Aliases
alias v=nvim
alias vim=nvim

# Go Path
export GOROOT=/usr/local/go
export GOPATH=/home/j/go
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOPATH/bin

# API Keys
source .api_keys
