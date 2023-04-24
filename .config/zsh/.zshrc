eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# enable zap - minimal plugin manager
[[ -f "$HOME/.local/share/zap/zap.zsh" ]] && source "$HOME/.local/share/zap/zap.zsh"

plug "kazhala/dotbare"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "wintermi/zsh-rust"
plug "wintermi/zsh-brew"

source $ZDOTDIR/functions.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/exports.zsh
source $ZDOTDIR/completions.zsh

if [[ -f $(brew --prefix)/etc/brew-wrap ]]; then
  source $(brew --prefix)/etc/brew-wrap

   _post_brewfile_update () {
     echo "Brewfile was updated!"
   }
fi
