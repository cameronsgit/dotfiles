Set-PSReadlineOption -EditMode 'Vi';
Set-PSReadlineOption -ViModeIndicator 'Prompt';
Set-PSReadlineOption -BellStyle 'None';
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete;

function Invoke-VimOnNT {
    $rep = $args -replace "\\","/";
    bash -c "vim $rep";
};

if ($IsLinux -or $IsMacOS) {
    Set-Alias -Name "vim" -Value "nvim" -Description "Use Neovim instead of vim on non-Windows platforms";
} else {
    if ($IsWindows -and $IsCoreCLR) {
        Add-WindowsPSModulePath;
    } else {
        Set-Alias -Name 'ipp' -Value "Import-PackageProvider -Name 'ChocolateyGet' | Out-Null" -Description 'Use OneGet for Chocolatey management';
    }
    Set-Alias -Name "vim" -Value Invoke-VimOnNT -Description "Use WSL for vim on Windows";
}

[char] $prompt = 0x276F;

function prompt {
    if ($isLinux -or $isMacOS) {
        "`e[035m$($prompt) `e[0m";
    } else {
        Write-Host -Object $prompt -NoNewLine -ForegroundColor DarkMagenta;
        return " ";
    }
};
