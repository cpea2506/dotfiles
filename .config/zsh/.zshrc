source $ZDOTDIR/functions.zsh

_install "zsh-users" "zsh-autosuggestions"
_install "zsh-users" "zsh-syntax-highlighting"
_install "chrissicool" "zsh-256color"

shards=(aliases completion prompt exports)
_add $shards[@]

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

source "$HOME/.cargo/env"

# wrap brew command for auto git updating
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap

   _post_brewfile_update () {
     echo "Brewfile was updated!"
   }
fi
