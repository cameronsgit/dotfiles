Set-PSReadlineOption -EditMode Vi
Set-PSReadlineOption -BellStyle None
Set-PSReadlineOption -ViModeIndicator Prompt

if ($IsLinux -Or $IsOSX) {
	Set-Alias vim nvim
} else {
	Set-Alias less more
}

# this char is not supported with default fonts for most platforms
[char]$prompt = 0x276F

function prompt {
	$prompt + " "
}
