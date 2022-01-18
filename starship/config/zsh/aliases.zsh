#!$(which zsh)
source $ZDOTDIR/functions.zsh

alias ~=cd
alias cl=clear 
alias train=sl
alias lg=lazygit
alias neo=neofetch
alias aqua=asciiquarium
alias btm="btm -C $HOME/.config/btm/config.toml"

# kitty
alias icat="kitty +kitten icat"

alias ..="cd .."
alias nvide="neovide --frameless"
alias nix-remove="nix-collect-garbage"

# git
alias gcl="git clone --recurse-submodules"
alias gcm="git commit -m"
alias gco="git checkout -b"
alias gp="git pull"
alias gm="git merge"
alias gst="git status"
alias gra="git remote add"
alias grs="git remote set-url"

# database
alias postgres-start="postgres -D /opt/homebrew/var/postgres"
alias mysql-start="mysqld_safe --datadir=/opt/homebrew/var/mysql"

# tree search
alias ls="exa -a --color=always --icons --group-directories-first"
alias ll="exa -la --color=always --icons --group-directories-first"
alias tree="exa -a --color=always --icons --group-directories-first -T"
