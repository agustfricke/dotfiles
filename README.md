# .dotfiles

## Dependencies
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install stow fzf blueman zsh curl kitty gimp tmux i3 git build-essential feh lxappearance xclip sqlite3 libfuse2 ripgrep -y 
# webkit
sudo apt install libwebkit2gtk-4.0-dev file libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev -y
# rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
# go
wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz -P ~/
tar -C ~/.local/share -xzf ~/go1.22.5.linux-amd64.tar.gz  
rm ~/go1.22.5.linux-amd64.tar.gz 
# Node
wget https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.xz -P ~/
tar -C ~/.local/share -xJf ~/node-v20.10.0-linux-x64.tar.xz
rm ~/node-v20.10.0-linux-x64.tar.xz
# Neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -P ~/
chmod u+x ~/nvim.appimage
sudo mv ~/nvim.appimage /usr/local/bin/vim
# Docker
sudo apt-get remove docker docker-engine docker.io containerd runc 
sudo apt-get update 
sudo apt-get install ca-certificates curl gnupg 
sudo install -m 0755 -d /etc/apt/keyrings 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg  
sudo chmod a+r /etc/apt/keyrings/docker.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list 
sudo apt-get update -y 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 
# KVM
sudo apt install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo virsh net-start default 
sudo virsh net-autostart default 
sudo usermod -aG libvirt $USER 
sudo usermod -aG libvirt-qemu $USER 
sudo usermod -aG kvm $USER 
sudo usermod -aG input $USER 
sudo usermod -aG disk $USER 
# Roboto Mono Nerd Font
mkdir ~/.local/share/fonts
wget -O ~/RobotoMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
unzip ~/RobotoMono.zip -d ~/.local/share/fonts 
rm ~/RobotoMono.zip
```

## Installation 
```bash
git clone https://github.com/agustfricke/dotfiles.git ~/.dotfiles
cd .dotfiles
stow x
stow bin 
stow i3
stow kitty
stow nvim
stow tmux
stow zsh
mkdir ~/personal ~/work
# reboot machine and select i3 WM
```

# GitHub ssh
Generating a new SSH key
```bash
ssh-keygen -t ed25519 -C "agustfricke@protonmail.com"
```
Start the ssh-agent in the background and add your SSH private key to the ssh-agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
Copy and past to your GitHub account
```bash
cat ~/.ssh/id_ed25519.pub
```
