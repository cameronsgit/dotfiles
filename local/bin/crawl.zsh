#!/usr/bin/env zsh

function dcss {
    pushd "/Applications/Dungeon Crawl Stone Soup - Console.app/Contents/Resources/"
    ./crawl &
    popd
}
