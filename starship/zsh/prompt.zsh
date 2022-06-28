setopt nopromptbang prompt{cr,percent,sp,subst}
setopt prompt_subst

zstyle -e ':completion:*:default' \
	list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")';
