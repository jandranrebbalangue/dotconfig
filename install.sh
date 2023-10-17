#!/usr/bin/env bash
install_i3() {
  echo "Installing i3"
[ -f "/etc/arch-release" ] && install_i3wm_on_arch
echo "Copy i3 config"
cp ./i3/config $HOME/.config/i3/config
echo "Done installing i3"
}

install_tmux() {
echo "Installing tmux"
[ -f "/etc/arch-release" ] && install_tmux_on_arch
echo "Copy tmux config"
cp ./tmux/.tmux.conf $HOME/.tmux.conf
echo "Done installing tmux"
}

install_tmux_on_arch() {
echo "installing tmux on arch"
sudo pacman -S tmux
sudo pacman -S xclip
}

install_i3wm_on_arch() {
echo "Installing i3 on arch"
sudo pacman -S i3-wm
}

install_picom_on_arch() {
echo "Installing picom on arch"
sudo pacman -S picom
}

install_picom() {
  echo "Installing picom"
[ -f "/etc/arch-release" ] && install_picom_on_arch
echo "Copy picom config"
cp ./picom/picom.conf $HOME/.config/picom.conf
}
install_alacritty_on_arch() {
echo "installing rust and cargo"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Installing dependencies for alacritty on arch"
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
echo "installing alacritty"
cargo install alacritty
echo "Done installing alacritty"
}
install_alacritty() {
  echo "Installing alacritty"
[ -f "/etc/arch-release" ] && install_alacritty_on_arch
echo "Create config folder for alacritty"
mkdir $HOME/.config/alacritty/
echo "Copy alacritty config"
cp ./alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
echo "Done"
}
install_httpie_on_arch() {
echo "Installing httpie on arch"
sudo pacman -Syu httpie
}

install_neofetch_on_arch() {
echo "Installing neofetch on arch"
sudo pacman -S neofetch
}
install_httpie() {
  echo "Installing httpie"
[ -f "/etc/arch-release" ] && install_httpie_on_arch
echo "Copy httpie config"
cp ./httpie/config.json $HOME/.config/httpie/config.json
echo "Done"
}
install_neofetch() {
  echo "Installing neofetch"
[ -f "/etc/arch-release" ] && install_neofetch_on_arch
echo "Copy neofetch config"
cp ./neofetch/config.conf $HOME/.config/neofetch/config.conf
echo "Copy neofetch logo"
cp ./neofetch/logo $HOME/.config/neofetch/logo
echo "Done"
}
install_lazygit_on_arch() {
echo "Installing lazygit on arch"
 sudo pacman -S lazygit 
}
install_lazygit() {
echo "Installing lazygit"
[ -f "/etc/arch-release" ] && install_lazygit_on_arch
echo "Done"
}

setup() {
  echo "starting to setup"
  install_i3
  install_tmux
  install_picom
  install_alacritty
  install_httpie
  install_neofetch
  install_lazygit
  echo "Done install setup"
}

setup
