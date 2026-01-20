#! /bin/bash

#error encounter
set -euo pipefail
# create temporary install list
cat packs/pacman.txt > temp.pac
cat packs/aur.txt > temp.aur


# install nvidia drivers if nececarry
echo
echo \#############################################################################################################
echo
read -p "install nvidia drivers? [y/n]" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo nvidia-open-dkms >> temp.pac
fi

# install pacman packages
cat temp.pac | sudo pacman -Sy - --no-confirm

# install AUR packages
sudo pacman -Sy --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

cat temp.aur | yay -Sy - --noprovides --answerdiff None --answerclean None --mflags "--noconfirm"

# apply configs
sudo pacman -Sy --needed rsync

su -c 'rsync -cr root/ / -v'


#Set Rofi Power Menu (comming soon)
#chmod +x /usr/bin/rofi-power-menu
#gsettings set org.gnome.desktop.interface gtk-theme RetroDark
#gsettings set org.gnome.desktop.interface icon-theme RetroDark

sudo locale-gen


sudo chsh -s /usr/bin/fish

# apply services
sudo systemctl disable getty@tty1.service
sudo systemctl disable getty@tty2.service
sudo systemctl disable getty@tty3.service
sudo systemctl enable ly@tty1.service
sudo systemctl enable ly@tty2.service
sudo systemctl enable ly@tty3.service
