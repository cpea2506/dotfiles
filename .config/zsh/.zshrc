source $ZDOTDIR/functions.zsh

__install "zsh-users" "zsh-autosuggestions"
__install "zsh-users" "zsh-syntax-highlighting"
__install "kazhala" "dotbare"

shards=(aliases completion prompt exports)
__use $shards[@]

source "$HOME/.cargo/env"

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap

   _post_brewfile_update () {
     echo "Brewfile was updated!"
   }
fi
