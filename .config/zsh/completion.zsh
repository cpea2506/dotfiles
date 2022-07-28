zstyle ':completion:*' menu select
zmodload zsh/complist

for d in "/share/zsh-completions" "/share/zsh/site-functions"; do
	zsh_completion=$(brew --prefix 2>/dev/null)$d

	if [ $? -eq 0 ] && [ -d $zsh_completion ]; then
		fpath=($zsh_completion $fpath)
	fi
done

autoload -Uz compinit

if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
	compinit
else
	compinit -C
fi

# setup dotbare completion
_dotbare_completion_cmd

_comp_options+=(globdots)

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^[[Z' vi-up-line-or-history
bindkey -v '^?' backward-delete-char
