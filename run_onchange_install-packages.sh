#!/bin/sh

printf "Install Brew\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

printf "\nInstall Brewfile\n"
brew install rcmdnk/file/brew-file
brew file set_repo -r git@github.com:cpea2506/Brewfile -y
brew file install
