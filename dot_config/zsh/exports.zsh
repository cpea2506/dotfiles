export PATH="$HOME/.local/bin:$HOME/.dotnet/tools:/opt/homebrew/opt/llvm/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"

# fzf
export FZF_DEFAULT_OPTS="--layout=reverse --color=hl:#c678dd,hl+:#c678dd,info:green,header:blue"

# brew 
export HOMEBREW_NO_INSTALL_CLEANUP=true

# llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
