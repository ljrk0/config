#! /bin/sh

set -e

mkdir -p ~/.config

mkdir -p ~/.config/environment.d
for conf in $PWD/environment/[0-9][0-9]-*.conf $PWD/environment/systemd-user-session.conf; do
    ln -sf "$conf" ~/.config/environment.d/
done
case $(hostname) in
"slartibartfast"|"hoopyfrood"|"zaphod")
    ln -sf "$PWD/environment/40B-intel.conf" ~/.config/environment.d/
    ;;
"Eddie")
    ln -sf "$PWD/environment/40A-amd.conf" ~/.config/environment.d/
    ;;
*)
    printf "Warning: unknown computer '%s', no specialised config installed\n" $(hostname)
    ;;
esac

#ln -sf $PWD/i3status-rs ~/.config/
#ln -sf $PWD/sway ~/.config/
#ln -sf $PWD/mako ~/.config/
#ln -sf $PWD/kanshi ~/.config/
#ln -sf $PWD/kitty ~/.config/

ln -sf $PWD/kak ~/.config/
ln -sf $PWD/kak-lsp ~/.config/
ln -sf $PWD/latexmk ~/.config/

ln -sf $PWD/zsh/zprofile ~/.zprofile
ln -sf $PWD/zsh/zshenv ~/.zshenv
ln -sf $PWD/zsh/zshrc ~/.zshrc

ln -sf $PWD/bash/bash_profile ~/.bash_profile
ln -sf $PWD/bash/bashrc ~/.bashrc
ln -sf $PWD/bash/bash_logout ~/.bash_logout

ln -sf $PWD/sh/profile ~/.profile

ln -sf $PWD/readline/inputrc ~/.inputrc
