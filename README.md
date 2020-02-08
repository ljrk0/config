# Dotfiles

*The scripts are to be run interactively!*

Everything package-related is done with ArchLinux in mind.

## Changes not covered by the scripts

* Pretty much the complete installation of the system
* Adding to `input` and `video` group (backlight)
* Installing and configuring `git` and `openssh`
* Switching to `zsh`
* Enabling `sddm`, `NetworkManager`
* For kakoune, installing plug.kak locally, then running plug-install
* Downloading kitty-themes
* After `rustup` is installed, a toolchain should be installed:
  ```
  $ rustup install stable
  $ rustup component add clippy llvm-tools-preview rls rust-analysis # optional
  ```
* `/etc/makepkg.conf`: Set `CFLAGS`, `CXXFLAGS`, `MAKEFLAGS`
* `/etc/pacman.conf`: Enable multilib and color output
* `/etc/systemd/logind.conf`: Ignore Lid on external power
* Setting the themes, this is done through GUIs
* Setting up and fixing SWAP in LUKS on LVM
* Configuring Konsole, Firefox

## Changes not *yet* covered (TODO)

* Support for non-intel CPUs (ucode)

