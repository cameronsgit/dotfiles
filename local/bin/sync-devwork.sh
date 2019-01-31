#!/usr/bin/env bash
function sync-devwork() {
    printf "\\e[32m Switching directories...\\e[0m \\n"
    pushd ~/Development || exit
    printf "\\e[32m Updating git repos...\\e[0m \\n"
    find "$(pwd)" -type d -depth 2 | xargs -P10 -I {} hub -C {} sync
    printf "\\e[32m Switching back...\\e[0m \\n"
    popd || exit
    printf "\\e[32m Done! \\e[0m \\n"
}
