Set-PSReadlineOption -EditMode Vi;
Set-PSReadlineOption -BellStyle None;
Set-PSReadlineOption -ViModeIndicator Prompt;

function Invoke-VimOnNT {
	$rep = $args -replace "\\","/"
	bash -c "vim $rep"
};

if ($IsLinux -or $IsMacOS) {
    Set-Alias -Name "vim" -Value "nvim" -Description "Use Neovim instead of vim on non-Windows platforms";
} else {
    Import-PackageProvider -Name "ChocolateyGet" | Out-Null
    Set-Alias -Name "vim" -Value Invoke-VimOnNT -Description "Use WSL for vim on Windows";
}

[char] $prompt = 0x276F;

function prompt {
	if ($isLinux -or $isMacOS) {
		$prompt + " "
	} else {
		Write-Host ($prompt) -NowNewLine -ForegroundColor DarkMagenta
			return ''
	}
};
