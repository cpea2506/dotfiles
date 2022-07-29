function __install() {
    local PLUGIN_DIR="zsh_plugins"

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

function help() {
    "$@" --help 2>&1 | bat --plain --language=help
}

function gccd() {
  command git clone --recurse-submodules "$@"
  [[ -d "$_" ]] && cd "$_" || cd "${${_:t}%.git}"
}

function gi() {
  local api="https://www.toptal.com/developers/gitignore/api"
  local files=

  if [[ ! -z "$1" ]]; then
    files=$(echo "$@" | sed "s/[[:blank:]]//g")
  else
    files=$(curl -s $api/list | tr "," "\n" | fzf -m --cycle | tr "\n" "," | sed "s/,$//g")
  fi

  if [[ -n $files ]]; then
    command curl -sLo .gitignore $api/$files
    echo ".gitignore file for $files created"
  fi
}
