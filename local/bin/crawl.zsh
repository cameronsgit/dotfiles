#!/usr/bin/env zsh

# usage
# crawl => play my local install version
# crawl -online => watch live games ppl are playing or play one myself


# TODO: prbly should re-write to pwsh so I can use it on Windows as well.


function crawl {
    local online_user="crawl"
    local online_host="crawl.develz.org"
    local binary_path="/Applications/Dungeon Crawl Stone Soup - Console.app/Contents/Resources/"
    if [ -n "$1" ]
    then
        # Play / watch online
        ssh -i ~/.ssh/cao_key "${online_user}@${online_host}"
    else
        # Play locally
        "${binary_path}/crawl" &
    fi
}
