
#yay -S libxft-bgra-git 

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
