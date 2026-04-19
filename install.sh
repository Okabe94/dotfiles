#!/bin/bash

echo "Installing git..."
sudo pacman -S git --noconfirm

echo "Cloning dotfiles..."
git clone -b main https://github.com/Okabe94/dotfiles

echo "Installing yay..."
sudo pacman -S --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si --noconfirm

APPS=(
  stow
  less
  btop
  fastfetch
  yazi
  fzf
  lsa
  zoxide
  swaync
  waybar
  wofi
  hyprpaper
  hyprlock
  hyprsunset
  hyprshot
  hypridle
  nvim
  lazyvim
  lazygit
  wiremix
  heroic-games-launcher-bin
  thunar
  bitwarden
  zen-browser-bin
  steam
  android-studio
  vesktop-bin
  virt-manager
  clonehero
  unrar
  p7zip
  mpv
  ollama
)

echo "Installing applications..."
yay -S "${APPS[@]}" --noconfirm

echo "Installing fonts..."
sudo pacman -S adwaita-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-arimo-nerd nerd-fonts awesome-terminal-fonts woff2-font-awesome --noconfirm

echo "Removing files that will be overwritten..."
rm .bashrc
rm -rf .config/hypr/

echo "Stowing configuration..."
cd /home/okabe94/dotfiles/ || exit
stow .
hyprctl reload

echo "Install has finish. Please reboot!!!"
