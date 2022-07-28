function __install() {
    PLUGIN_DIR="zsh_plugins"

    if [[ -d $ZDOTDIR/$PLUGIN_DIR/$2 ]]; then
        source $ZDOTDIR/$PLUGIN_DIR/$2/$2.plugin.zsh || \
        source $ZDOTDIR/$PLUGIN_DIR/$2/$2.zsh
    else
        git clone "https://github.com/$1/$2.git" "$ZDOTDIR/$PLUGIN_DIR/$2"
        source ~/.zshrc
    fi
}

function __use() {
	for item in $@; do
		source $ZDOTDIR/$item.zsh
	done
}

function mkcd() {
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

function help() {
    "$@" --help 2>&1 | bat --plain --language=help
}
