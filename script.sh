# https://github.com/ynejmi/home-dir

# TODO:   - link root 
#         - .local
#         - nvim fonts
#         - src / bins in separate repos

#sudo systemctl enable NetworkManager
#sudo systemctl start NetworkManager

#rfkill unblock 0 1 2 3

#sudo nmcli d wifi connect SSID5G hidden yes password 21280941 || exit

# Making sure deps exist
sudo pacman -Syu --needed --noconfirm zsh git curl base-devel sed
sudo rm -Rf ~/.local ~/.config
mkdir ~/.local
mkdir ~/.config

mkdir -p /mnt/hdd
#sudo sh -c 'echo "#/dev/sda2" >> /etc/fstab'
#sudo sh -c 'echo "UUID=6CBEAA21BEA9E3B4                           /mnt/hdd        ntfs           rw      0 2" >> /etc/fstab'

sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S --noconfirm --needed \
	xorg-server xorg-xinit xorg-xsetroot xorg-xbacklight xorg-xprop rsync \
	noto-fonts noto-fonts-emoji ttf-jetbrains-mono ttf-dejavu ttf-joypixels ttf-font-awesome \
	#noto-fonts-cjk font-manager \
	ranger sxiv xwallpaper python-pywal unclutter xclip maim npm \
	zsh zsh-syntax-highlighting zsh-autosuggestions fzf \
	xdotool man-db brightnessctl sxhkd htop polkit lxsession\
	ntfs-3g rsync jq libconfig cowsay openssh dunst \
	arc-gtk-theme lxappearance qt5ct 

sudo sh -c 'echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'

#sudo pacman -Syu --needed --noconfirm firefox code thunar qbittorrent

# Chaotic aur
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Yay setup
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm --needed
cd

yay -S --noconfirm --needed picom-jonaburg-git pulsemixer

sudo pacman -Syu --noconfirm --needed libxft nerd-fonts-jetbrains-mono

# /etc
sudo cp -r ~/home-dir/etc/* /etc
sudo rm -Rf /etc/X11/xorg.conf.d
sudo mv /etc/xorg.conf.d /etc/X11

# .local - .config

cd $HOME
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ynejmi/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

# suckless
sudo make clean install -C ~/.local/src/suckless/st || exit 1
sudo make clean install -C ~/.local/src/suckless/dwm
sudo make clean install -C ~/.local/src/suckless/dwmblocks-async
sudo make clean install -C ~/.local/src/suckless/dmenu
sudo make clean install -C ~/.local/src/suckless/pinentry-dmenu

# shell
ln -s ~/.config/x11/xinitrc ~/.xinitrc
ln -s ~/.config/shell/profile ~/.zprofile
export ZSH="$HOME/.config/zsh/oh-my-zsh"
echo  $ZSH
ls -la $ZSH
rm -Rf $ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended --keep-zshrc"
rm ~/.shell.pre-oh-my-zsh
rm ~/.zshrc* ~/.zsh_history ~/.bash*
ln -s ~/.config/zsh/.zshrc ~/.zshrc

chsh -s /bin/zsh $USER

source ~/.zprofile
source ~/.zshrc

echo "Congrats, now reboot"
sleep 3

exec zsh
