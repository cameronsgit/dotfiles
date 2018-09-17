#!/bin/sh
softwareupdate --install -all
brew cleanup
brew update
brew upgrade
brew cask upgrade
mas upgrade
