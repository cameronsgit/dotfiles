#!/bin/bin/env bash

function system-update() {
    softwareupdate --install -all
    brew cleanup
    brew update
    brew upgrade
    brew upgrade --cask
    mas upgrade
    rustup update
}
