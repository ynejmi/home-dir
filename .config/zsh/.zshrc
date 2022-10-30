export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(git)
source $ZSH/oh-my-zsh.sh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$XDG_CONFIG_HOME/shell/aliasrc"
#cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"
clear

alias l='ls -lA'
alias ll='clear && ls -la'
alias gcl='git clone'
alias rmd='rm -Rfv'
alias md='mkdir -p'
alias pcmi='sudo pacman -S --needed --noconfirm'
alias pcmr='sudo pacman -Rs'
alias pcmq='sudo pacman -Q'
alias nv='nvim'
alias snv='sudo nvim'
alias svst='systemctl status'
alias svs='sudo systemctl start'
alias sv='sudo systemctl '
alias zedit='nvim ~/.config/zsh/.zshrc && source ~/.config/zsh/.zshrc'
alias xedit='nvim ~/.xinitrc'
alias pedit='nvim ~/.config/picom/picom.conf'
alias vedit='nvim ~/.config/nvim/init.vim'
alias stedit='nvim ~/.local/src/st/config.h && sudo make -C ~/.local/src/st/ clean install'
alias iedit='nvim ~/.config/sxiv/exec/key-handler'
alias dwmedit='nvim ~/.local/src/dwm/config.h && sudo make -C ~/.local/src/dwm/ clean install'
alias dbedit='nvim ~/.local/src/dwmblocks/config.h && sudo make -C ~/.local/src/dwmblocks/ clean install'
alias clrcat='clear && bat $1'
alias stop='powershell.exe wsl --shutdown'
alias reboot='powershell.exe Restart-Computer'
#alias adb='adb.exe'
#alias fastboot='fastboot.exe'
alias winget='winget.exe'
alias psh='powershell.exe'
alias cdd='cd /mnt/c/Users/apex/Desktop'

