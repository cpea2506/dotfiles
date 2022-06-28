function _install {
    if [[ -d $ZDOTDIR/plugins/$2 ]]; then 
        source $ZDOTDIR/plugins/$2/$2.plugin.zsh || \
        source $ZDOTDIR/plugins/$2/$2.zsh
    else
        git clone "https://github.com/$1/$2.git" "$ZDOTDIR/plugins/$2"
        source ~/.zshrc
    fi
}

function _add {
	for item in $@; do
		source $ZDOTDIR/$item.zsh
	done
}

function mkcd {
  if [[ ! -n $1 ]]; then
    echo "Enter a directory name"
  elif [[ -d $1 ]]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

function gccd() {
  command git clone --recurse-submodules "$@"
  [[ -d "$_" ]] && cd "$_" || cd "${${_:t}%.git}"
}
