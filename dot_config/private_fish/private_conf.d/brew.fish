status is-interactive || exit

/opt/homebrew/bin/brew shellenv | source

if test -f (brew --prefix)/etc/brew-wrap.fish
    source (brew --prefix)/etc/brew-wrap.fish
end
