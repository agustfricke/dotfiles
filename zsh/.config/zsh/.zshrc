source $ZDOTDIR/zshrc


# pnpm
export PNPM_HOME="/home/agust/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
