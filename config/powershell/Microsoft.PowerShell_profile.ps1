$PSReadLineOptions = @{
    EditMode = 'Vi'
    ViModeIndicator = 'Prompt'
    BellStyle = 'None'
    Colors = @{
        Command = "`e[37m"
        Comment = '#383838'
        Number = '#BA8BAF'
        Member = "`e[93m"
        String = "`e[32m"
        Variable = '#7CAFC2'
        Selection = '#B8B8B8'
        DefaultToken = '#AB4642'
        Operator = "`e[96m"
        Type = '#DC9656'
        Parameter = "`e[37m"
    }
};

Set-PSReadlineOption @PSReadLineOptions;
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
    Write-Host -Object $prompt -NoNewline -ForegroundColor DarkMagenta;
    return " ";
};

