# Laptop specific wifi setup (networkmanager pkg needed)
#sudo systemctl enable NetworkManager
#sudo systemctl start NetworkManager

#rfkill unblock 0 1 2 3

#sudo nmcli d wifi connect SSID5G hidden yes password 21280941 || exit



# Making sure deps exist
sudo pacman -Syu --needed --noconfirm zsh git curl base-devel sed



# Nice headstart // temp
#git clone https://github.com/bugswriter/arch-linux-magic

#sudo bash ~/home-dir/my-arch-linux-magic/arch_install.sh

sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xsetroot xorg-xbacklight xorg-xprop \
     noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-jetbrains-mono ttf-joypixels \
     sxiv \
     man-db xwallpaper python-pywal unclutter xclip maim \
     xdotool brightnessctl  \
     ntfs-3g sxhkd zsh \
     arc-gtk-theme rsync dash \
     jq \
     rsync \
     zsh-syntax-highlighting zsh-autosuggestions libconfig \
     bluez bluez-utils

rm /bin/sh
ln -s dash /bin/sh
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


#sudo pacman -Syu --needed --noconfirm firefox code thunar


sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo  pacman-key --lsign-key FBA220DFC880C036
sudo  pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Yay setup
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -fsri --noconfirm --needed

sudo pacman -Sy libxft-bgra-git



# Personal setup
#git clone https://github.com/ynejmi/home-dir

# /etc
sudo cp -r ~/home-dir/etc/* /etc
sudo rm -Rf /etc/X11/xorg.conf.d
sudo mv /etc/xorg.conf.d /etc/X11

# .local // later

cp -r ~/home-dir/.local/src ~/.local/

sudo make clean install -C ~/.local/src/st
sudo make clean install -C ~/.local/src/dwm
sudo make clean install -C ~/.local/src/dwmblocks
sudo make clean install -C ~/.local/src/dmenu
sudo make clean install -C ~/.local/src/pinentry-dmenu

# .config
cp -r ~/home-dir/.config/zsh ~/.config/
cp -r ~/home-dir/.config/x11 ~/.config/
cp -r ~/home-dir/.config/shell ~/.config/


# todo: need to chsh - link root

ln -s ~/.config/x11/xinitrc ~/.xinitrc
ln -s ~/.config/shell/profile ~/.zprofile
export ZSH="$HOME/.config/zsh/oh-my-zsh"
echo  $ZSH

rm -Rf $ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended --keep-zshrc"
rm ~/.shell.pre-oh-my-zsh
rm ~/.zshrc* ~/.zsh_history
ln -s ~/.config/zsh/.zshrc ~/.zshrc

echo "done"

#~/home-dir/my-arch-linux-magic/part2.sh



