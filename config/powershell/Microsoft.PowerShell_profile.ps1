Set-PSReadlineOption -EditMode Vi;
Set-PSReadlineOption -BellStyle None;
Set-PSReadlineOption -ViModeIndicator Prompt;
Set-PSReadlineOption -ShowToolTips;
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete;
<#
Set-PSReadlineOption -TypeForegroundColor '#DC9656';
Set-PSReadlineOption -CommandForegroundColor "`e[37m";
Set-PSReadlineOption -CommentForegroundColor '#383838';
Set-PSReadlineOption -NumberForegroundColor '#BA8BAF';
Set-PSReadlineOption -MemberForegroundColor "`e[93m";
Set-PSReadlineOption -StringForegroundColor "`e[32m";
Set-PSReadlineOption -VariableForegroundColor '#7CAFC2';
Set-PSReadlineOption -SelectionForegroundColor '#B8B8B8';
Set-PSReadlineOption -DefaultTokenForegroundColor '#AB4642';
Set-PSReadlineOption -OperatorForegroundColor "`e[96m";
Set-PSReadlineOption -TypeForegroundColor '#DC9656';
Set-PSReadlineOption -ParameterForegroundColor "`e[37m";
#>
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
#Set-PSReadLineOption -PromptText ($prompt + " ")

function prompt {
    if ($isLinux -or $isMacOS) {
        $prompt + " ";
    } else {
        Write-Host -Object $prompt -NoNewline -ForegroundColor DarkMagenta;
        return " ";
    }
};
