Set-PSReadlineOption -EditMode Vi;
Set-PSReadlineOption -BellStyle None;
Set-PSReadlineOption -ViModeIndicator Prompt;

function Invoke-VimOnNT {
	wsl vim $args
};

if ($IsLinux -Or $IsOSX) {
	Set-Alias -Name "vim" -Value "nvim" -Description "Use Neovim instead of vim on non-windows platforms";
} else {
	Import-PackageProvider -Name "ChocolateyGet" | Out-Null
	Set-Alias -Name "vim" -Value Invoke-VimOnNT -Description "Use WSL for vim";
}

[char] $prompt = 0x276F

function prompt {
	$prompt + " "
};
