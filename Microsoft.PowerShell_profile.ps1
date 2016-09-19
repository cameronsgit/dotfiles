Set-PSReadlineOption -EditMode Vi
if ($IsLinux) {
    Set-Alias vim nvim
}
[char]$prompt = 0x276F
function prompt {
    $prompt + " "
}
