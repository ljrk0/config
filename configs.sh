#! /bin/sh

set -e

mkdir -p ~/.config
ln -sf $PWD/environment ~/.config/environment.d
ln -sf $PWD/i3status-rs ~/.config/
ln -sf $PWD/sway ~/.config/
ln -sf $PWD/kak ~/.config/
ln -sf $PWD/kak-lsp ~/.config/
ln -sf $PWD/latexmk ~/.config/

ln -sf $PWD/zsh/zprofile ~/.zprofile
ln -sf $PWD/zsh/zshenv ~/.zshenv
ln -sf $PWD/zsh/zshrc ~/.zshrc
ln -sf $PWD/sh/profile ~/.profile
