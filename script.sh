# Laptop specific wifi setup (networkmanager pkg needed)
#sudo systemctl enable NetworkManager
#sudo systemctl start NetworkManager

#rfkill unblock 0 1 2 3 

#sudo nmcli d wifi connect SSID5G hidden yes password 21280941 || exit



# Making sure deps exist
#sudo pacman -Syu --needed --noconfirm zsh git curl base-devel



# Nice headstart // temp
#git clone https://github.com/bugswriter/arch-linux-magic

#sudo bash ~/arch-linux-magic/arch_install.sh

sudo pacman -Syu --needed --noconfirm firefox code thunar


# Yay setup
#git clone https://aur.archlinux.org/yay.git
#cd yay && makepkg -si --noconfirm --needed




# Personal setup
#git clone https://github.com/ynejmi/home-dir

# /etc
#sudo cp -r ~/home-dir/etc/* /etc
#sudo rm -Rf /etc/X11/xorg.conf.d
#sudo mv /etc/xorg.conf.d /etc/X11

# .local // later

#cp -r ~/home-dir/.local/src ~/.local/

#sudo make clean install -C ~/.local/src/st
#sudo make clean install -C ~/.local/src/dwm
#sudo make clean install -C ~/.local/src/dwmblocks
#sudo make clean install -C ~/.local/src/dmenu
#sudo make clean install -C ~/.local/src/pinentry-dmenu

# .config
#cp -r ~/home-dir/.config/zsh ~/.config/
#cp -r ~/home-dir/.config/x11 ~/.config/
#cp -r ~/home-dir/.config/shell ~/.config/


# todo: need to chsh - link root 

#~/arch-linux-magic/part2.sh





