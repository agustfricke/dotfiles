# !/bin/bash
# manual config
# sudo apt update && sudo apt upgrade -y
# sudo apt install i3 -> logout -> select i3 -> login
# $_ lxappearance -> set theme

# Some Dependencies
sudo apt install git
sudo apt install build-essential
sudo apt install feh
sudo apt install lxappearance
sudo apt install arc-theme

# i3 blocks
git clone https://github.com/Airblader/i3blocks-gaps i3blocks
cd i3blocks
make clean debug
sudo make install 

# Clone repo from github
git clone https://github.com/agustfricke/dotfiles.git

# i3 config
cp -r ~/dotfiles/i3 ~/.config/
cp -r ~/dotfiles/i3blocks ~/.config/

# rofi 
sudo apt install rofi
cp -r ~/dotfiles/rofi ~/.config/

# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip

unzip FiraCode.zip -d ~/.local/share/fonts
unzip JetBrainsMono.zip -d ~/.local/share/fonts

# Rust & Cargo
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"

# pip
sudo apt install python3-pip

# nodejs 
wget https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz
tar -xf node-v18.16.0-linux-x64.tar.xz
mv ~/node-v18.16.0-linux-x64 ~/.nodejs

# bun
curl -fsSL https://bun.sh/install | bash

# go
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ~/go1.20.4.linux-amd64.tar.gz

# alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
cp ~/dotfiles/alacritty ~/.config

# docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo rm /etc/apt/sources.list.d/docker.list
sudo cp ~/dotfiles/docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
sudo cp ~/nvim-linux64/bin/nvim /usr/local/bin

# Lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y 

# Lunarvim config
rm .config/lvim/config.lua
cp ~/dotfiles/lvim/config.lua ~/.config/lvim/config.lua

# :LspSettings pyright
# paste -> {
#   "python.analysis.typeCheckingMode": "off"
# }

# GitHub Copilot 
# git clone https://github.com/github/copilot.vim.git \
#   ~/.config/nvim/pack/github/start/copilot.vim
# Inside of LunarVim -> :Copilot setup

# Wallpaper
mv ~/dotfiles/Wallpapers ~/Pictures

# GitHub ssh
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh
ssh-keygen -t ed25519 -C "agustfricke@protonmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub
# Paste the ssh key in GitHub account https://github.com/settings/keys

# Brave Browser
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install OBS
sudo apt install software-properties-common
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio

# Install audacity
sudo apt install audacity

# Install Kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt update
sudo apt install kdenlive

# zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh $USER
sudo -s 
chsh -s /bin/zsh root
echo "Okay, it seems like everything is ready... Enjoy!"
sudo reboot

# Done!




