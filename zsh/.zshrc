if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_INSTANT_PROMPT=quiet

export ZSH="/Users/CPea2506/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-completions
	nix-shell
    git
    cargo
    autojump
)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
ulimit -n 10240

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/Users/CPea2506/.local/bin:$PATH"
export PATH="$(yarn global bin):$PATH"

# alias
alias lg="lazygit"
alias neo="neofetch"
alias aqua="asciiquarium"
alias nvide="neovide --frameless"
alias train="sl"
alias pvim="nvim"
