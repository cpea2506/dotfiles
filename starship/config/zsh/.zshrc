source $ZDOTDIR/functions.zsh

install "zsh-users" "zsh-autosuggestions"
install "zsh-users" "zsh-syntax-highlighting"
install "chrissicool" "zsh-256color"

shards=(aliases completion prompt exports)
add $shards[@]

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
