#!/bin/bash

# Set up Node Version Manager
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Update Homebrew
printf "Updating Homebrew..."
brew update
printf "Done!\n"

# Upgrade Homebrew
printf "Upgrading Homebrew...\n"
#brew upgrade
printf "Skipping upgrade while on beta...\n"
printf "Done!\n"


# Upgrade installed Casks **NOT CURRENTLY WORKING**
#printf "Attempting to upgrade installed Casks..."
#for c in $(brew cask list); do
#	info=$(brew cask info $c)
#	installed_ver=$(printf "$info" | cut -d$'\n' -f1 | tr -d ' ' | cut -d':' -f 2)
#	current_ver=$(printf "$info" | cut -d$'\n' -f3 | cut -d' ' -f 1 | rev | cut -d'/' -f 1 | rev)
#	if [ "$installed_ver" != "$current_ver" ]; then
#		printf "$c is installed '$installed_ver', current is '$current_ver'"
#		brew cask reinstall $c
#	fi
#	printf "Done!"
#done

# Cleanup Homebrew
printf "Cleaning up Homebrew..\n"
brew cleanup
printf "Done!\n"

printf "Cleaning up installed Casks\n"
brew cask cleanup
printf "Done!\n"

# Update installed gems
printf "Updating installed gems...\n"
eval "$(rbenv init -)" && gem update
printf "Done!\n"

# Update Ocaml packages
printf "Updating opam...\n"
printf "Skipping upgrade while on beta...\n"
#opam update && opam upgrade
printf "Done!\n"

# Node.js
printf "nvm version is set to v7.5.0\n Upgrading global packages....\n"
nvm use default && npm upgrade --global
printf "Done!\n"

printf "Outdated Casks:\n"
brew cask outdated

# Lists oudated rocks
luarocks list --outdated

# Updates Rustup tool
printf "Updating rustup...\n"
rustup self update

# Update the rust toolchain
printf "Updating Rust...\n"
printf "Skipping update while on beta...\n"
#rustup update

# Requires admin access
printf "Updating Nuget...\n"
printf "Skipping update while on beta...\n"
#sudo nuget update -self
