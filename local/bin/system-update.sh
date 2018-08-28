#!/bin/bash

# -*- mode: sh -*-
# vi: set ft=sh :

softwareupdate --install -all
brew cleanup
brew update
brew upgrade
brew cask upgrade
mas upgrade
