export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$XDG_CONFIG_HOME/shell/aliasrc"
#cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"
neofetch --disable theme icons resolution uptime shell wm kernel --os_arch off

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}

alias l='ls -lA'
alias ll='clear && ls -la'
alias gcl='git clone'
alias rmd='rm -Rfv'
alias md='mkdir -p'
alias pcmi='sudo pacman -S --needed --noconfirm'
alias open='xdg-open'
alias nv='nvim'
alias snv='sudo nvim'
alias svst='systemctl status'
alias svs='sudo systemctl start'
alias sv='sudo systemctl '
alias zedit='nvim ~/.config/zsh/.zshrc && source ~/.config/zsh/.zshrc'
alias xedit='nvim ~/.xinitrc'
alias pedit='nvim ~/.config/picom/picom.conf'
alias stedit='nvim ~/.local/src/st/config.h && sudo make -C ~/.local/src/st/ clean install'
alias iedit='nvim ~/.config/sxiv/exec/key-handler'
alias dwmedit='nvim ~/.local/src/dwm/config.h && sudo make -C ~/.local/src/dwm/ clean install'
alias dbedit='nvim ~/.local/src/dwmblocks/config.h && sudo make -C ~/.local/src/dwmblocks/ clean install'
alias clrcat='clear && bat $1'

