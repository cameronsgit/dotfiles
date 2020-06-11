#!/bin/bin/env bash

function system-update() {
    softwareupdate --install -all
    brew cleanup
    brew update
    brew upgrade
    brew cask upgrade
    mas upgrade
    rustup update
    tldr --update
}
