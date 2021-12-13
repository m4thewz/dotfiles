#!/usr/bin/env bash

sudo clear

echo
echo "Installing Packages"
echo

PKGS=(
  'bc'
  'curl'
  'wget'
  'feh'
  'hardinfo'
  'htop'
  'neofetch'
  'ntp'
  'numlockx'
  'openssh'
  'rsync'
  'speedtest-cli'
  'unrar'
  'unzip'
  'kitty'
  'zenity'
  'zip'
  'zsh'
  'zsh-completions'

  'neovim'
  'nodejs'
  'npm'
  'python'
  'yarn'

  'lollypop'
  'simplescreenrecorder'
  'vlc'

  'gcolor2'
  'gimp'
  'inkscape'
  'imagemagick'
  'pngcrush'
  'ristretto'

  'galculator'
  'libreoffice-fresh'
  'xpdf'                
)

for PKG in "${PKGS[@]}"; do
  echo "Installing: ${PKG}"
  sudo pacman -S "$PKG" --noconfirm --needed
done

cp -r .config .local ~/
