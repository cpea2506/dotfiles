#!$(which zsh)
source $ZDOTDIR/functions.zsh

alias ~=cd
alias cl=clear 
alias lg=lazygit
alias neo=neofetch
alias btm="btm -C $HOME/.config/btm/config.toml"

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

# tree search
alias ls="exa -a --color=always --icons --group-directories-first"
alias ll="exa -la --color=always --icons --group-directories-first"
alias tree="exa -a --color=always --icons --group-directories-first -T"
