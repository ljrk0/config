#! /bin/sh

set -e

# base is not a group
groups="base-devel kf5 kf5-aids plasma qt qt5 texlive-most texlive-lang"

sway="sddm bemenu brightnessctl dex grim jq i3status-rust j4-dmenu-desktop mako slurp sway swaybg swayidle swaylock waybar kanshi-git wl-clipboard"
kde="okular dolphin ksshaskpass"
apps="firefox libreoffice-fresh thunderbird biber texlive-most-doc kitty"
vms="libvirt virt-manager qemu ovmf freerdp"
terminal="htop kakoune openssh openbsd-netcat tmux zip unzip tree zsh pacman-contrib luarocks texlab bear inetutils"
theme="qt5ct lxappearance-gtk3 noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-iosevka-ss05 ttf-font-awesome powerline-fonts dconf-editor"
boot="sbsigntools sbupdate-git efibootmgr efitools intel-ucode"
net="dhclient networkmanager"
audio="pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-zeroconf pavucontrol-qt"
misc="xdg-desktop-portal xdg-user-dirs reflector rustup"

pkgs="$sway $kde $apps $vms $terminal $theme $boot $net $audio $misc"

command -v yay > /dev/null
if [ $? -eq 1 ]; then
    pushd /tmp
    curl --output yay.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
    tar xvf yay.tar.gz
    cd yay
    makepkg -s
    sudo pacman -U yay-*.pkg.tar.xz
    popd
fi

yay -S --needed $groups
yay -S --needed $pkgs
