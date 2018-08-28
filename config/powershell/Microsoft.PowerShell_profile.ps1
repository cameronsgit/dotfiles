$PSReadLineOptions = @{
    EditMode = 'Vi'
    ViModeIndicator = 'Prompt'
    BellStyle = 'None'
};

Set-PSReadlineOption @PSReadLineOptions;
Set-PSReadlineOption -TokenKind Command -ForegroundColor White;
Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Gray;
Set-PSReadlineOption -TokenKind Comment -ForegroundColor DarkGray;
Set-PSReadlineOption -TokenKind String -ForegroundColor Green;
Set-PSReadlineOption -TokenKind Variable -ForegroundColor Blue;
Set-PSReadlineOption -TokenKind Type -ForegroundColor Yellow;
Set-PSReadlineOption -TokenKind Keyword -ForegroundColor Red;
Set-PSReadlineOption -TokenKind Operator -ForegroundColor Cyan;
Set-PSReadlineOption -TokenKind Number -ForegroundColor Magenta;
Set-PSReadlineOption -TokenKind Member -ForegroundColor DarkYellow;
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
        $prompt + " ";
    } else {
        Write-Host -Object $prompt -NoNewLine -ForegroundColor DarkMagenta;
        return " ";
    }
};
