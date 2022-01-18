function install {
    if [[ -d $ZDOTDIR/plugins/$2 ]]; then 
        source $ZDOTDIR/plugins/$2/$2.plugin.zsh || \
        source $ZDOTDIR/plugins/$2/$2.zsh
    else
        git clone "https://github.com/$1/$2.git" "$ZDOTDIR/plugins/$2"
        source ~/.zshrc
    fi
}

# use to count the time zsh start
function ztime {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function exists {
	[[ -f $1 ]]
}

function _current_language {
	if exists Cargo.*(N) || exists *.rs(N); then
		echo '%F{#EE7950}'
	elif exists *.*sx(N); then
		echo '%F{#519aba}'
	elif exists *.lua(N); then
		echo '%F{#42a5f5}'
	elif exists *.ts(N); then
		echo '%F{#3172bc}ﯤ'
	elif exists *.js(N); then
		echo '%F{#e7d54c}'
	elif exists *.swift(N); then
		echo '%F{#e37933}ﯣ'
	elif exists *.vim(N); then
		echo '%F{#43a047}'
	elif exists *.zsh(N); then
		echo '%F{#89e051}'
	else
		echo ''
	fi
}

function _branch_ahead_behind {
    local a=$1 b="origin/$1"
    local base=$( git merge-base $a $b )
    local aref=$( git rev-parse  $a )
    local bref=$( git rev-parse  $b )

    if [[ $aref == $bref ]]; then
        echo ""
    elif [[ $aref == $base ]]; then
        echo " ↓"
    elif [[ $bref == $base ]]; then
        echo " ↑"
    else
        echo " ﳤ"
    fi
}

function add {
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

# get time command execution
zmodload zsh/datetime

function time_preexec {
  prompt_prexec_realtime=${EPOCHREALTIME}
}

function time_precmd {
  if (( prompt_prexec_realtime )); then
    local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
    local -rF s=$(( elapsed_realtime%60 ))
    local -ri elapsed_s=${elapsed_realtime}
    local -ri m=$(( (elapsed_s/60)%60 ))
    local -ri h=$(( elapsed_s/3600 ))
    if (( h > 0 )); then
    	printf -v prompt_elapsed_time '%ih%im ' ${h} ${m}
    elif (( m > 0 )); then
    	printf -v prompt_elapsed_time '%im%is ' ${m} ${s}
    elif (( s >= 10 )); then
      	printf -v prompt_elapsed_time '%.2fs ' ${s} # 12.34s
    elif (( s >= 1 )); then
      	printf -v prompt_elapsed_time '%.3fs ' ${s} # 1.234s
    else
      	printf -v prompt_elapsed_time '%ims ' $(( s*1000 ))
    fi
    unset prompt_prexec_realtime
  else
    # Clear previous result when hitting ENTER with no command to execute
    unset prompt_elapsed_time
  fi
}

