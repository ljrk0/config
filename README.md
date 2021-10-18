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

## Shell configuration & Environment variables

We use the following mechanisms to configure the shell:

**Bash**

* .bashrc
* .bash_profile
* ~~.bash_env~~

**Zsh**

* .zshrc
* .zprofile
* ~~.zshenv~~

**Shell Common**

* .profile

**Graphical Wayland Session**

* .config/environment.d

### Usage

The goal is to be a) mostly shell-independent (Zsh not always available etc.),
i.e., have a consistent experience across any shell and b) to have a clear
structure where to define/change what setting.

What we *want* are the following things:

1. A place to configure our shell-specific things like internal commands,
   plugins and the like (.bashrc / .zshrc)
2. Some *common* place to put environment variables and the like that persist
   within a terminal session (.profile)
3. Some *common* place to put environment variables that are specific to a
   graphical Wayland session (.config/environment.d)
4. ~~Some *common* place to put environment variables to be newly set on startup
   of any new terminal (.env)~~

### Bash

Bash distinguishes 3 cases:

* We are a login shell:  Load `.bash_profile` only.
* We are *not* a login shell *but* an interactive shell:  Load `.bashrc` only.
* We are *neither* a login shell, *nor* an interactive shell:  Load nothing.

In order to implement our goal with these limited files, we set up extra logic:

1. If we are a login shell: Load `.bash_profile`
   i. If we are *also* interactive, chain-load `.bashrc`
   ii. Load the common `.profile`
       a. For graphical sessions, load ~/.config/environment.d/, if not already
          done through GDM/gnome.
2. If we are no login shell, but an interactive shell: Load `.bashrc`
   Since the environment set by .profile/environment.d is inherited, we don't
   need to explicitly source it.

