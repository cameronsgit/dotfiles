#!/usr/bin/env pwsh
#Requires -Version 5.0
#Requires -Modules PSReadline, posh-git

using namespace System;

Set-StrictMode -Version 'Latest';

Import-Module 'PSReadline';
Import-Module 'posh-git';

Set-PSReadlineOption -BellStyle 'None';
Set-PSReadlineOption -EditMode 'Vi';
Set-PSReadlineOption -ExtraPromptLineCount 1;
Set-PSReadlineOption -ViModeIndicator 'Prompt';
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete;

[char] $promptIndicator = 0x276F;
$GitPromptSettings.AfterStatus.Text = $null;
$GitPromptSettings.BeforeStatus.Text = $null;
$GitPromptSettings.BranchColor.ForegroundColor = 0x585858;
$GitPromptSettings.BranchIdenticalStatusSymbol.Text = $null;
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = "$([Environment]::NewLine)";
$GitPromptSettings.DefaultPromptPath.Text = $null;
$GitPromptSettings.DefaultPromptPrefix.Text = ' ';
$GitPromptSettings.DefaultPromptSuffix = "$($promptIndicator) ";
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = 0xD3869B;
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true

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

function prompt {
    & $GitPromptScriptBlock;
};
