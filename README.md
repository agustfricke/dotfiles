## .dotfiles

### Setup
```bash
wget -O - https://raw.githubusercontent.com/agustfricke/dotfiles/main/install.sh | bash
```

##### Neovim
- For Neovim config, run the commands **:so** and **:PackerSync** in normal mode with Neovim in the file **~/.config/nvim/lua/agust/packer.lua**

##### Tmux
- For tmux theme, press prefix and then capital **i** to install the theme plugin.


##### Zsh
```bash
cp ~/dotfiles/linux-mint/zsh/.zshrc ~/.zshrc

rm ~/.local/share/zap/plugins/zap-prompt/zap-prompt.zsh-theme
cp -r ~/dotfiles/linux-mint/zsh/zap-prompt.zsh-theme ~/.local/share/zap/plugins/zap-prompt

rm ~/.local/share/zap/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
cp -r ~/dotfiles/linux-mint/zsh/zsh-vi-mode.plugin.zsh ~/.local/share/zap/plugins/zsh-vi-mode
```

https://github.com/agustfricke/dotfiles/assets/110266171/0cdecfda-fa4b-4a20-ad82-114e6f256d13
