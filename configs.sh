#! /bin/sh

set -e

mkdir -p ~/.config
ln -sf $PWD/environment ~/.config/environment.d
ln -sf i3status-rs ~/.config/
ln -sf sway ~/.config/

ln -sf zsh/zprofile ~/.zprofile
ln -sf zsh/zshenv ~/.zshenv
ln -sf zsh/zshrc ~/.zshrc
ln -sf sh/profile ~/.profile
