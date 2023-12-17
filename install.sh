#!/bin/bash
# Este script no está terminado!

# Variables
DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config
FONTS_DIR=~/.local/share/fonts
I3BLOCKS_CONTRIB_DIR=$CONFIG_DIR/i3blocks-contrib
NODE_VERSION=v18.16.0
GO_VERSION=1.21.3

# Install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install i3 git acpi build-essential feh lxappearance arc-theme xclip -y

# Clone i3blocks-contrib repo
git clone https://github.com/vivien/i3blocks-contrib.git $I3BLOCKS_CONTRIB_DIR

# Build and install i3blocks
git clone https://github.com/Airblader/i3blocks-gaps ~/i3blocks
cd ~/i3blocks
make clean debug
sudo make install

# Copy i3 and i3blocks config
cp -r $DOTFILES_DIR/i3 $CONFIG_DIR/
cp -r $DOTFILES_DIR/i3blocks $CONFIG_DIR/
git clone https://github.com/vivien/i3blocks-contrib.git ~/scripts
mv ~/scripts ~/.config/i3blocks

# Install Nerd Fonts
wget -O ~/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
unzip ~/FiraCode.zip -d $FONTS_DIR

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install Node
wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz -P ~/
tar -xf ~/node-$NODE_VERSION-linux-x64.tar.xz
mv ~/node-$NODE_VERSION-linux-x64 ~/.node

# Install Go
wget https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ~/go$GO_VERSION.linux-amd64.tar.gz

# Install Alacritty
git clone https://github.com/alacritty/alacritty.git ~/alacritty
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
cd ~/alacritty
cargo build --release
sudo cp ~/alacritty/target/release/alacritty /usr/local/bin
cp -r $DOTFILES_DIR/alacritty $CONFIG_DIR/

# Install Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo rm /etc/apt/sources.list.d/docker.list
sudo cp $DOTFILES_DIR/docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/vim

# Set Wallpaper
mv $DOTFILES_DIR/Wallpapers ~/Pictures

# Install Brave Browser
sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install OBS
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update -y
sudo apt install obs-studio -y

# Install Audacity
sudo apt install audacity -y

# Install Kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo apt update -y
sudo apt install kdenlive -y

# Install fzf
sudo apt install fzf -y
sudo mv $DOTFILES_DIR/tools/f /usr/local/bin

# Install tmux
sudo apt install tmux -y
cp $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf

# Delete folders
sudo rm -r ~/alacritty ~/Desktop ~/i3blocks ~/node-$NODE_VERSION-linux-x64.tar.xz ~/go$GO_VERSION.linux-amd64.tar.gz Music Public Templates $DOTFILES_DIR

# Create folders
mkdir personal
mkdir work

# GitHub SSH
ssh-keygen -t ed25519 -C "agustfricke@protonmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Install Virt Manager
sudo apt install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo virsh net-start default
sudo virsh net-autostart default
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG disk $USER

# Neovim config
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r $DOTFILES_DIR/nvim $CONFIG_DIR/

# Install zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# Copy zsh config
cp $DOTFILES_DIR/zsh/zshrc-mint ~/.zshrc
chsh -s /bin/zsh $USER
chsh -s /bin/zsh root
