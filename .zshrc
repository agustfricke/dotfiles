[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
export VI_MODE_ESC_INSERT="<Esc>" && plug "zap-zsh/vim"

echo -ne '\e[2 q'

autoload -Uz compinit
compinit

export EDITOR=vim

export PATH=$PATH:$HOME/.local/share/go/bin
export GOPATH="$HOME/.local/share/.go" 
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/.local/share/node/bin

export PNPM_HOME="/home/agust/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
