#!/usr/bin/env pwsh
#Requires -Version 5
#Requires -Modules PSReadline, posh-git

using namespace System;
using namespace System.Management.Automation;
using namespace System.Runtime.InteropServices;

$PSSessionConfigurationName = (
    # PowerShell 7 / Core
    'http://schemas.microsoft.com/powershell/PowerShell.7'
);

Set-StrictMode -Version 'Latest';

Import-Module 'posh-git';
Import-Module 'PSReadline';

Set-PSReadlineOption -BellStyle 'None';
Set-PSReadlineOption -EditMode 'Vi';
Set-PSReadlineOption -ExtraPromptLineCount 1;
Set-PSReadlineOption -ViModeIndicator 'Prompt';
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete;

[hashtable] $local:environment = @{ Visibility = 'Public'; ErrorAction = 0; Scope = 'Global'; };

Set-Variable @local:environment -Name 'IsCoreCLR' -Value (-not $PSEdition -eq 'Desktop' -or (Get-Variable -Name 'IsCoreCLR' -ValueOnly -EA 0));
Set-Variable @local:environment -Name 'IsFreeBSD' -Value ([OSPlatform]::GetNames([OSPlatform]) -contains 'FreeBSD');
Set-Variable @local:environment -Name 'IsMacOS'   -Value ([RuntimeInformation]::IsOSPlatform([OSPlatform]::OSX) -or (Get-Variable -Name 'IsMacOS' -ValueOnly -EA 0));
Set-Variable @local:environment -Name 'IsLinux'   -Value ([RuntimeInformation]::IsOSPlatform([OSPlatform]::Linux) -or (Get-Variable -Name 'IsLinux' -ValueOnly -EA 0));
Set-Variable @local:environment -Name 'IsWindows' -Value ([RuntimeInformation]::IsOSPlatform([OSPlatform]::Windows) -or (Get-Variable -Name 'IsWindows' -ValueOnly -EA 0));
if (-not $PSEdition -eq 'Desktop') {
    Set-Variable @local:environment -Name 'IsUnix'    -Value ([Environment]::OSVersion.Platform -in @([PlatformID]::MacOSX, [PlatformID]::Unix) -or [RuntimeInformation]::IsOSPlatform([OSPlatform]::FreeBSD));
} else {
    Set-Variable @local:environment -Name 'IsUnix'    -Value $false;
}

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

$env:PSModulePath = $env:PSModulePath + ":~/.local/share/powershell/Modules";

$null = Register-EngineEvent -SourceIdentifier 'PowerShell.OnIdle' -MaxTriggerCount 1 -Action {
    Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$($wordToComplete)" | ForEach-Object {
            [CompletionResult]::new($_, $_, 'ParameterValue', $_);
        }
    }
    if ($global:IsLinux -or $global:IsMacOS) {
        if ($global:IsMacOS) {
            [SecureString] $script:pat = ConvertTo-SecureString "$(security find-generic-password -l 'ps-pat' -w)" -AsPlainText -Force;
            [PSCredential] $global:blkb = [PSCredential]::new($corpAccount, $script:pat);
        }
        Set-Alias -Name "vim" -Value "nvim" -Description "Use Neovim instead of vim on non-Windows platforms";
        Enable-AzureRmAlias;
        New-Module -Name 'ActiveDirectory' -ScriptBlock { } | Import-Module;
    } else {
        if ($global:IsWindows -and $global:IsCoreCLR) {
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
    }
}

function prompt {
    & $GitPromptScriptBlock;
}
