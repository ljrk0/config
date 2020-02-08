# Dotfiles

Note: Everything package-related is done with ArchLinux in mind.

## Usage

Clone recursively, to pick up eg. kitty-themes
```
$ git clone --recurse-submodules https://github.com/LeonardKoenig/config.git
```

Install and add configs

```
$ ./pkgs.sh
$ ./configs.sh
```

*The scripts are to be run interactively!*


## Changes not covered by the scripts

* Pretty much the complete installation of the system :-)
* Adding to `input` and `video` group (backlight)
* Installing and configuring `git` and `openssh`
* Enabling `sddm`, `NetworkManager`
* After `rustup` is installed, a toolchain should be installed:
  ```
  $ rustup install stable
  $ rustup component add clippy llvm-tools-preview rls rust-analysis # optional
  ```
* For kakoune, installing plug.kak locally, then running plug-install
* `/etc/makepkg.conf`: Set `CFLAGS`, `CXXFLAGS`, `MAKEFLAGS`
* `/etc/pacman.conf`: Enable multilib and color output
* `/etc/systemd/logind.conf`: Ignore Lid on external power
* Setting the GTK/Qt themes, this is done through qt5ct, lxappearance
* Setting up and fixing SWAP in LUKS on LVM
* Configuring Firefox

## Changes not *yet* covered (TODO)

* Support for non-intel CPUs (ucode)
