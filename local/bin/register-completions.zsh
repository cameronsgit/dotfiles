function _dotnet_zsh_complete() {
    local completions=("$(dotnet complete "$words")")
    reply=("${(ps:\n:)completions}")
}
