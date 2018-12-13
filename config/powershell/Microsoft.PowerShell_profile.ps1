#!/usr/bin/env pwsh
#Requires -Version 5.0
#Requires -Modules PSReadline, posh-git

using namespace System;

Set-StrictMode -Version 'Latest';

Import-Module 'PSReadline';
Import-Module 'posh-git';

Set-PSReadlineOption -EditMode 'Vi';
Set-PSReadlineOption -ViModeIndicator 'Prompt';
Set-PSReadlineOption -BellStyle 'None';
Set-PSReadlineOption -ExtraPromptLineCount 1;
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete;

[char] $promptIndicator = 0x276F;

$GitPromptSettings.DefaultPromptWriteStatusFirst = $true
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = "$([Environment]::NewLine)";
$GitPromptSettings.DefaultPromptSuffix = "$($promptIndicator) ";
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = 0xD3869B;
$GitPromptSettings.DefaultPromptPrefix.Text = ' ';
$GitPromptSettings.DefaultPromptPath.Text = $null;
$GitPromptSettings.BranchIdenticalStatusSymbol.Text = $null;
$GitPromptSettings.BeforeStatus.Text = $null;
$GitPromptSettings.AfterStatus.Text = $null;
$GitPromptSettings.BranchColor.ForegroundColor = 0x585858;

[char] $promptIndicator = 0x276F;

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
