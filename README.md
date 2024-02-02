## .dotfiles

### Setup
```bash
wget -O - https://raw.githubusercontent.com/agustfricke/dotfiles/main/install.sh | bash
```

##### Neovim
- For Neovim config, run the commands **:so** and **:PackerSync** in normal mode with Neovim in the file **~/.config/nvim/lua/agust/packer.lua**

##### Tmux
- For tmux theme, press prefix and then capital **i** to install the theme plugin.


##### Zsh zap
- For a block cursor with the zsh-vi-mode, set this line in **~/.local/share/zap/plugins/zsh-vi-mode/zsh-vi-mode.zsh**
```bash
ZVM_CURSOR_STYLE_ENABLED=false
```

- For the prompt, edit the file **~/.local/share/zap/plugins/zap-prompt/zap-prompt.zsh-theme**

https://github.com/agustfricke/dotfiles/assets/110266171/0cdecfda-fa4b-4a20-ad82-114e6f256d13
