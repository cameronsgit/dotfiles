#!/usr/bin/env pwsh
#Requires -Version 5
#Requires -Modules PSReadline, posh-git

using namespace System;
using namespace System.Management.Automation;
using namespace System.Runtime.InteropServices;

Set-StrictMode -Version 'Latest';

Import-Module 'PSReadline';
Import-Module 'posh-git';

Set-PSReadlineOption -BellStyle 'None';
Set-PSReadlineOption -EditMode 'Vi';
Set-PSReadlineOption -ExtraPromptLineCount 1;
Set-PSReadlineOption -ViModeIndicator 'Prompt';
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete;

[hashtable] $local:environment = @{ Visibility = 'Public'; ErrorAction = 0; };

Set-Variable @local:environment -Name 'IsCoreCLR' -Value (-not $PSEdition -eq 'Desktop' -or $IsCoreCLR);
Set-Variable @local:environment -Name 'IsFreeBSD' -Value ([OSPlatform].GetProperties().Name -contains 'FreeBSD');
Set-Variable @local:environment -Name 'IsMacOS'   -Value ([RuntimeInformation]::IsOSPlatform([OSPlatform]::OSX) -or $IsMacOS);
Set-Variable @local:environment -Name 'IsLinux'   -Value ([RuntimeInformation]::IsOSPlatform([OSPlatform]::OSX) -or $IsLinux);
Set-Variable @local:environment -Name 'IsWindows' -Value ([RuntimeInformation]::IsOSPlatform([OSPlatform]::Windows) -or $IsWindows);
Set-Variable @local:environment -Name 'IsUnix'    -Value ([Environment]::OSVersion.Platform -in @([PlatformID]::MacOSX, [PlatformID]::Unix) -or [RuntimeInformation]::IsOSPlatform([OSPlatform]::FreeBSD));

[char] $promptIndicator = 0x276F;
[string] $corpAccount = "cameron.sowder@blackbaud.me";
$GitPromptSettings.AfterStatus.Text = $null;
$GitPromptSettings.BeforeStatus.Text = $null;
$GitPromptSettings.BranchColor.ForegroundColor = 0x585858;
$GitPromptSettings.BranchIdenticalStatusSymbol.Text = $null;
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = "$([Environment]::NewLine)";
$GitPromptSettings.DefaultPromptPath.Text = $null;
$GitPromptSettings.DefaultPromptPrefix.Text = ' ';
$GitPromptSettings.DefaultPromptSuffix = "$($promptIndicator) ";
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = 0xD3869B;
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true;

$global:hubs = Import-PowerShellDataFile -Path "~/.config/powershell/hubs.psd1";

Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$($wordToComplete)" | ForEach-Object {
            [CompletionResult]::new($_, $_, 'ParameterValue', $_);
        }
};

if ($IsLinux -or $IsMacOS) {
    if ($IsMacOS) {
        [SecureString] $script:pat = ConvertTo-SecureString "$(security find-generic-password -l 'ps-pat' -w)" -AsPlainText -Force;
        [PSCredential] $global:blkb = [PSCredential]::new($corpAccount, $script:pat);
    }
    Set-Alias -Name "vim" -Value "nvim" -Description "Use Neovim instead of vim on non-Windows platforms";
    Enable-AzureRmAlias;
} else {
    if ($IsWindows -and $IsCoreCLR) {
        Add-WindowsPSModulePath;
    } else {
        [void] [Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
        [Windows.Security.Credentials.PasswordVault] $vault = New-Object Windows.Security.Credentials.PasswordVault;
        $account = $vault.Retrieve('ps-pat', $corpAccount);
        [SecureString] $script:pat = ConvertTo-SecureString $account.Password -AsPlainText -Force;
        [PSCredential] $global:blkb = [PSCredential]::new($account.UserName, $script:pat);
    }
    Remove-Item -Path "Alias:/curl" -Force | Out-Null;
    function Invoke-VimOnNT { &bash -c "vim $($args -replace "\\", "/")" };
    Set-Alias -Name "vim" -Value Invoke-VimOnNT -Description "Use WSL for vim on Windows";
    Set-Alias -Name 'ipp' -Value "Import-PackageProvider -Name 'ChocolateyGet' | Out-Null" -Description 'Use OneGet for Chocolatey management';
}

function prompt {
    & $GitPromptScriptBlock;
}
