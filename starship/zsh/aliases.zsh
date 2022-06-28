#!$(which zsh)

alias ~=cd
alias ..="cd .."
alias cl=clear 
alias lg=lazygit
alias neo=neofetch


# git
alias gcl="git clone --recurse-submodules"
alias gcm="git commit -m"
alias gco="git checkout"
alias gp="git pull"
alias gm="git merge"
alias gst="git status"
alias gra="git remote add"
alias grs="git remote set-url"

# rust cargo
alias cgr="cargo run"
alias cgt="cargo test"
alias cgl="cargo clippy"

# tree search
alias ls="exa -a --color=always --icons --group-directories-first"
alias ll="exa -la --color=always --icons --group-directories-first"
alias tree="exa -a --color=always --icons --group-directories-first -T"
