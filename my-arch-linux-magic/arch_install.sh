#part2
pacman -S --noconfirm sed

sed -i 's/quiet/pci=noaer/g' /etc/default/grub
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
ai3_path=/home/$username/arch_install3.sh
