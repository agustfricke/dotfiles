# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"
echo -ne '\e[2 q'

# Load and initialise completion system
autoload -Uz compinit
compinit

alias tmux="TERM=screen-256color-bce tmux"
export PATH=$PATH:/usr/local/bin/node/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/.go"
export PATH=$PATH:$GOPATH/bin


