#!/bin/sh

# Brew
printf "Installing Brew\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

printf "\nInstalling Brewfile and Packages\n"
brew install rcmdnk/file/brew-file
brew file set_repo -r git@github.com:cpea2506/Brewfile -y
brew file install

# Rust
printf "\nInstalling Rustup and Cargo\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
