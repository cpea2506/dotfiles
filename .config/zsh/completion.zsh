zstyle ':completion:*' menu select
zmodload zsh/complist

for d in "/share/zsh-completions" "/share/zsh/zsh-site-functions"; do
  zsh_completion=$(brew --prefix 2>/dev/null)$d

  if [ $? -eq 0 ] && [ -d $zsh_completion ]; then
    fpath=($zsh_completion $fpath)
  fi
done

autoload -Uz compinit

# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.

_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))

if (( $#_comp_files )); then
  compinit -i -C
else
  compinit -i
fi

unset _comp_files

_comp_options+=(globdots)

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^[[Z' vi-up-line-or-history
bindkey -v '^?' backward-delete-char
