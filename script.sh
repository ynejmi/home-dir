# Laptop specific wifi setup (networkmanager pkg needed)
#sudo systemctl enable NetworkManager
#sudo systemctl start NetworkManager

#rfkill unblock 0 1 2 3

#sudo nmcli d wifi connect SSID5G hidden yes password 21280941 || exit



# Making sure deps exist
sudo pacman -Syu --needed --noconfirm zsh git curl base-devel sed
sudo rm -Rf ~/.local ~/.config
mkdir ~/.local
mkdir ~/.config



# Nice headstart // temp
#git clone https://github.com/bugswriter/arch-linux-magic

#sudo bash ~/home-dir/my-arch-linux-magic/arch_install.sh

sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xsetroot xorg-xbacklight xorg-xprop \
     noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-jetbrains-mono ttf-joypixels ttf-font-awesome \
     sxiv man-db xwallpaper python-pywal unclutter xclip maim bluez bluez-utils \
     xdotool brightnessctl ntfs-3g sxhkd zsh zsh-syntax-highlighting zsh-autosuggestions \
     arc-gtk-theme rsync dash jq rsync libconfig \
     

sudo rm /bin/sh
sudo ln -s dash /bin/sh
sudo sh -c 'echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'


#sudo pacman -Syu --needed --noconfirm firefox code thunar


sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Yay setup
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -fsri --noconfirm --needed

sudo pacman -Syu --noconfirm --needed libxft-bgra



# Personal setup
#git clone https://github.com/ynejmi/home-dir

# /etc
sudo cp -r ~/home-dir/etc/* /etc
sudo rm -Rf /etc/X11/xorg.conf.d
sudo mv /etc/xorg.conf.d /etc/X11

# .local // later

cp -r ~/home-dir/.local/src ~/.local/

sudo make clean install -C ~/.local/src/suckless/st
sudo make clean install -C ~/.local/src/suckless/dwm
sudo make clean install -C ~/.local/src/suckless/dwmblocks
sudo make clean install -C ~/.local/src/suckless/dmenu
sudo make clean install -C ~/.local/src/suckless/pinentry-dmenu

# .config
cp -r ~/home-dir/.config/zsh ~/.config/
cp -r ~/home-dir/.config/x11 ~/.config/
cp -r ~/home-dir/.config/shell ~/.config/


# todo: need to chsh - link root

ln -s ~/.config/x11/xinitrc ~/.xinitrc
ln -s ~/.config/shell/profile ~/.zprofile
export ZSH="$HOME/.config/zsh/oh-my-zsh"
echo  $ZSH
ls -la $ZSH
rm -Rf $ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended --keep-zshrc"
rm ~/.shell.pre-oh-my-zsh
rm ~/.zshrc* ~/.zsh_history ~/.bash
ln -s ~/.config/zsh/.zshrc ~/.zshrc

echo "done"

#~/home-dir/my-arch-linux-magic/part2.sh



