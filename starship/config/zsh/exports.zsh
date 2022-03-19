eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/heroku/bin:$PATH"
export STARSHIP_CONFIG="~/.config/starship/config.toml"
export STARSHIP_LOG="error"
