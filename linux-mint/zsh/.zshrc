[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"

echo -ne '\e[2 q'

autoload -Uz compinit
compinit

export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/.go" 
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:/usr/local/node/bin

export PNPM_HOME="/home/agust/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
