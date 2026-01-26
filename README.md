# MN-OS

[What is this?](#what-is-this)  
[Installing](#installing)    

## What is this?

This is an install script with accompanying dotfiles for my personal Arch Linux configuration.

|---|---|---|
| Distro | [Arch](https://archlinux.org/) |
| WM | [Niri](https://github.com/YaLTeR/niri) |
| Terminal | [alacritty](https://github.com/alacritty/alacritty) |
| Bar | [waybar](https://github.com/Alexays/Waybar/) |
| Menu | [rofi](https://davatorium.github.io/rofi/) |
| Notification | [mako](https://github.com/emersion/mako/) |
| File Manager | [Thunar](https://docs.xfce.org/xfce/thunar/start) |
| Lockscreen | [swaylock](https://github.com/swaywm/swaylock) |

> [!NOTE]
> my package list can be found in [pacman.txt](https://github.com/MN187/MN-OS/blob/main/packs/pacman.txt) & [aur.txt](https://github.com/MN187/MN-OS/blob/main/packs/aur.txt)
> some optional packages are listed in [install.sh](https://github.com/MN187/MN-OS/blob/main/install.sh)

## Installing

> [!WARNING]
> Follow these instructions at your own risk.  
> I am not responsible if any of this code causes loss of data.  
> You are fully responsible for your own actions, read the scripts.  

Follow the official [Arch Linux Installation Guide](https://wiki.archlinux.org/title/Installation_guide) to set up a minimal Arch installation with:
- Working internet access
- `git` installed
- At least one non-root user with sudo privileges

- clone the repo `https://github.com/MN187/MN-OS`
- `cd MN-OS`
- `chmod +x install.sh`
- install using `./install.sh`
> [!NOTE]
  
> The script will ask you for your set password. 
- For any `[y/n]` prompt during installation (including “Do you want to remove make dependencies?”), respond with `y`.


> [!IMPORTANT]  
> The Wallpaper will not be set on the first launch  
> to change the wallpaper press `Mod + T`
> run `swww img /usr/share/wallpapers/cph.gif` to set wallpaper
> or for own wallpaper run `swww img /path/to/img/file`
