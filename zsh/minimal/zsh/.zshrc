source $ZDOTDIR/zsh-functions

install "zsh-users" "zsh-autosuggestions"
install "zsh-users" "zsh-syntax-highlighting"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

add aliases
add completion
add prompt
add exports

