#!/bin/bash

echo "Installing git..."
sudo pacman -S git --noconfirm

echo "Cloning dotfiles..."
git clone https://github.com/Okabe94/dotfiles

echo "Installing yay..."
sudo pacman -S --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay || echo "Something went wrong!!!" && exit
makepkg -si --noconfirm

APPS=(
  stow
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
  wirex
  heroic-launcher
  thunar
  bitwarden-desktop
  zen-browser-bin
  steam
  android studio
  vesktop
  virt-manager
)

echo "Installing applications..."
yay -S "${APPS[@]}" --noconfirm

echo "Installing fonts..."
sudo pacman -S adwaita-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-arimo-nerd nerd-fonts awesome-terminal-fonts woff2-font-awesome --noconfirm
