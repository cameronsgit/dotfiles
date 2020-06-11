#!/usr/bin/env bash
function sync-devwork() {
    # Directory that source code lives in.
    local devPath="${HOME}/Development"
    # The depth that the actual git repo's are found under $devPath....(~/Development/Blackbaud/blackbaud-iaas-docs = 2 levels)
    local nestedLvl=2;
    printf "\\e[32m Switching directories...\\e[0m \\n"
    # Move to the root folder containing the git repos.
    pushd "${devPath}" || exit
    printf "\\e[32m Updating git repos...\\e[0m \\n"
    # The hub executable used used here from https://github.com/github/hub
    find "$(pwd)" -type d -depth $nestedLvl | xargs -P10 -I {} hub -C {} sync
    printf "\\e[32m Switching back...\\e[0m \\n"
    # Move back to where the user invoked the function from
    popd || exit
    printf "\\e[32m Done! \\e[0m \\n"
}

