eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(fnm env --use-on-cd)"

[[ -f "$HOME/.local/share/zap/zap.zsh" ]] && source "$HOME/.local/share/zap/zap.zsh"

plug "kazhala/dotbare"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "wintermi/zsh-rust"
plug "wintermi/zsh-brew"

for file in $ZDOTDIR/*.zsh; do
    source "$file"
done

if [[ -f $(brew --prefix)/etc/brew-wrap ]]; then
  source $(brew --prefix)/etc/brew-wrap

   _post_brewfile_update () {
     echo "Brewfile was updated!"
   }
fi
