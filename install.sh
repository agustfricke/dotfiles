#!/bin/bash

# Install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install i3 git acpi rofi build-essential feh lxappearance arc-theme xclip -y
git clone https://github.com/agustfricke/dotfiles.git ~/dotfiles

# Build and install i3blocks
git clone https://github.com/Airblader/i3blocks-gaps ~/i3blocks
cd ~/i3blocks
make clean debug
sudo make install

# Copy i3 and i3blocks config
cp -r ~/dotfiles/i3 ~/.config/i3
cp -r ~/dotfiles/i3blocks ~/.config/i3blocks
git clone https://github.com/vivien/i3blocks-contrib.git ~/scripts
mv ~/scripts ~/.config/i3blocks

# Rofi 
cp -r ~/dotfiles/rofi ~/.config

# Font
wget -O ~/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
unzip ~/FiraCode.zip -d ~/.local/share/fonts

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Node
wget https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.xz -P ~/
mkdir -p ~/.node
tar -xf ~/node-v20.10.0-linux-x64.tar.xz -C ~/.node --strip-components=1

# Go
wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -P ~/
sudo tar -C /usr/local -xzf ~/go1.21.5.linux-amd64.tar.gz

# Alacritty
git clone https://github.com/alacritty/alacritty.git ~/alacritty
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
cd ~/alacritty
cargo build --release
sudo cp ~/alacritty/target/release/alacritty /usr/local/bin
cp -r ~/dotfiles/alacritty ~/.config

# Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo rm /etc/apt/sources.list.d/docker.list
sudo cp ~/dotfiles/docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/vim

# Set Wallpaper
mv ~/dotfiles/Wallpapers ~/Pictures

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
sudo mv ~/dotfiles/tools/f /usr/local/bin

# Install tmux
sudo apt install tmux -y
cp ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Delete folders
directories_to_remove=(
    ~/FiraCode.zip
    ~/alacritty
    ~/Desktop
    ~/i3blocks
    ~/node-*.tar.xz  
    ~/go*.linux-amd64.tar.gz
    ~/Music
    ~/Public
    ~/Templates
)

for item in "${directories_to_remove[@]}"; do
    sudo rm -r "$item"
done

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
cp -r ~/dotfiles/nvim ~/.config

# Install zsh
sudo apt install zsh -y

# Copy zsh config
chsh -s /bin/zsh $USER
chsh -s /bin/zsh root

# zap
main() {

    local HELP KEEP
    local BRANCH=(master)
    local OPTIONS_USAGE=(
        "USAGE:"
        "    install.zsh [options]"
        " "
        "OPTIONS:"
        "    -h, --help     Show this help message"
        "    -k, --keep     Don't override existing .zshrc"
        "    -b, --branch   Zap repository branch name"
    )

    echo "⚡ Zap - Installer\n"

    zmodload zsh/zutil
    zparseopts -D -K -- \
        {h,-help}=HELP \
        {k,-keep}=KEEP \
        {b,-branch}:=BRANCH ||
    return 1

    [[ -z "$HELP" ]] || { print -l $OPTIONS_USAGE && return }

    local BACKUP_SUFFIX="$(date +%Y-%m-%d)_$(date +%s)"
    local ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
    local ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

    # check if ZAP_DIR already exists
    [[ -d "$ZAP_DIR" ]] && {
        echo "Zap is already installed in '$ZAP_DIR'!"
        read -q "res?Reinstall Zap? [y/N] "
        echo ""
        [[ $res == "n" ]] && {
            echo "❕ skipped!"
            return
        }
        echo "Reinstalling Zap..."
        rm -rf "$ZAP_DIR"
    }

    # Clone the Zap Repository branch
    git clone -b "$BRANCH[-1]" https://github.com/zap-zsh/zap.git "$ZAP_DIR" &> /dev/null || { echo "❌ Git is a dependency for zap. Please install git and try again." && return 2 }

    # Only modify .zshrc file if --keep flag not set
    if [[ -z "$KEEP" ]]; then
        # Check the .zshrc template exists
        if [ ! -f "$ZAP_DIR/templates/default-zshrc" ]; then
            echo "Template .zshrc file was not found in Zap installation"
            return 2
        fi

        # Check if the current .zshrc file exists
        if [ -f "$ZSHRC" ]; then
            # Move the current .zshrc file to the new filename
            mv "$ZSHRC" "${ZSHRC}_${BACKUP_SUFFIX}"
            echo "Moved .zshrc to .zshrc_$BACKUP_SUFFIX"
        else
            echo "No .zshrc file found, creating a new one..."
            touch "$ZSHRC"
        fi

        # Write out the .zshrc template to the .zshrc
        cat "$ZAP_DIR/templates/default-zshrc" >> "$ZSHRC"
    fi

    echo " Zapped"
    echo "Find more plugins at http://zapzsh.org"

    return 0
}

main $@

[[ $? -eq 0 ]] && source "${ZDOTDIR:-$HOME}/.zshrc" || return

# Write to new .zshrc
echo 'alias tmux="TERM=screen-256color-bce tmux"' >> ~/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export GOPATH="$HOME/.go"' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
echo 'export PATH=$PATH:/home/agust/.node/bin' >> ~/.zshrc
echo 'export PNPM_HOME="/home/agust/.local/share/pnpm"' >> ~/.zshrc
echo 'case ":$PATH:" in *":$PNPM_HOME:"*) ;; *) export PATH="$PNPM_HOME:$PATH" ;; esac' >> ~/.zshrc
