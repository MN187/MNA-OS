#! /bin/bash

#remove the repository 1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#error encounter
set -euo pipefail
# create temporary install list
cat packs/pacman.txt > temp.pac
cat packs/aur.txt > temp.aur
cat packs/desktop.txt > temp.des

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
cat temp.pac | sudo pacman -Sy - --noconfirm

# install AUR packages
sudo pacman -Sy --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

cat temp.aur | yay -Sy - --answerdiff None --answerclean None --mflags "--noconfirm"

# apply configs
sudo pacman -Sy --needed rsync --noconfirm


su -c 'rsync -cr root/ / -v'

# install pipes.sh
git clone https://github.com/pipeseroni/pipes.sh
cd pipes.sh
sudo make install
cd ..
sudo rm -r pipes.sh

sudo locale-gen

chsh -s /usr/bin/fish


#remove useless .Desktop files
sudo bash -c 'while read -r f; do rm -f "/usr/share/applications/$f"; done < temp.des'


# apply services
sudo systemctl disable getty@tty1.service
sudo systemctl disable getty@tty2.service
sudo systemctl disable getty@tty3.service
sudo systemctl enable ly@tty1.service
sudo systemctl enable ly@tty2.service
sudo systemctl enable ly@tty3.service

echo
read -p "MN-OS installed. Reboot now? [y/n] " -n 1 -r
echo

#remove the repository 2
echo "Removing installation repository..."
sudo rm -rf "$SCRIPT_DIR"

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Rebooting system..."
    reboot
else
    echo "Installation finished."
    echo "Please reboot the system to start using MN-OS."
fi
