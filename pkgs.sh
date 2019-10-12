#! /bin/sh

set -e

# base is not a group
groups="base-devel kf5 kf5-aids plasma qt qt5 texlive-most texlive-lang"

sway="sddm bemenu brightnessctl dex grim i3status-rust-git j4-dmenu-desktop mako slurp sway swaybg swayidle swaylock waybar"
kde="konsole okular dolphin"
apps="firefox libreoffice-fresh  thunderbird biber texlive-most-doc"
vms="libvirt virt-manager qemu ovmf freerdp"
terminal="htop kakoune-git vim openssh openbsd-netcat tmux zip unzip tree zsh pacman-contrib"
theme="qt5ct lxappearance-gtk3 noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-iosevka-ss05 dconf-editor"
boot="sbsigntools sbupdate-git efibootmgr efitools intel-ucode"
net="dhclient networkmanager"
audio="pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-zeroconf} pavucontrol-qt"
misc="xdg-desktop-portal xdg-user-dirs reflector rustup"

pkgs="$sway $kde $apps $vms $terminal $theme $boot $net $audio $misc"

pushd /tmp
curl --output yay.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
tar xvf yay.tar.gz
cd yay
makepkg -s
sudo pacman -U yay-*.pkg.tar.xz
popd

yay -S --needed $groups
yay -S --needed $pkgs
