#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install fzf kitty gimp tmux i3 git build-essential feh lxappearance arc-theme xclip -y 
git clone https://github.com/agustfricke/dotfiles.git ~/dotfiles

cp -r ~/dotfiles/linux-mint/kitty ~/.config

cp -r ~/dotfiles/linux-mint/i3 ~/.config

wget -O ~/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip 
unzip ~/FiraCode.zip -d ~/.local/share/fonts 
rm ~/FiraCode.zip

wget https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.xz -P ~/ 
tar -xf ~/node-v20.10.0-linux-x64.tar.xz 
sudo mv ~/node-v20.10.0-linux-x64 /usr/local/node
rm ~/node-v20.10.0-linux-x64.tar.xz

wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -P ~/ 
sudo tar -C /usr/local -xzf ~/go1.21.5.linux-amd64.tar.gz
rm ~/go1.21.5.linux-amd64.tar.gz

sudo apt-get remove docker docker-engine docker.io containerd runc 
sudo apt-get update 
sudo apt-get install ca-certificates curl gnupg 
sudo install -m 0755 -d /etc/apt/keyrings 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg  
sudo chmod a+r /etc/apt/keyrings/docker.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list 
sudo rm /etc/apt/sources.list.d/docker.list 
sudo cp ~/dotfiles/linux-mint/docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update -y 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 

wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage  
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/vim

mv ~/dotfiles/Wallpapers ~/Pictures

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -r ~/dotfiles/linux-mint/tmux ~/.config

sudo apt install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo virsh net-start default 
sudo virsh net-autostart default 
sudo usermod -aG libvirt $USER 
sudo usermod -aG libvirt-qemu $USER 
sudo usermod -aG kvm $USER 
sudo usermod -aG input $USER 
sudo usermod -aG disk $USER 

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
cp -r ~/dotfiles/nvim ~/.config


wget -qO- https://get.pnpm.io/install.sh | sh - 

sudo apt install zsh -y 

curl -sLO https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh
zsh ./install.zsh --branch release-v1

cp ~/dotfiles/linux-mint/zsh/.zshrc ~/.zshrc

sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update -y
sudo apt install obs-studio -y

sudo apt install audacity -y

sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo apt update -y
sudo apt install kdenlive -y

mkdir personal
mkdir work
mkdir kvm


