Import-Module PSReadline
Set-PSReadlineOption -EditMode Vi
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Get-PSSnapin -Name *Remote.Desktop* -Registered | % { Write-Host "$_..." -NoNewline;
if ( (Get-PSSnapin -Name $_ -ErrorAction SilentlyContinue) -eq $null )
 { Write-Host "installing" -ForegroundColor Yellow; Add-PsSnapin $_ }
else
 { Write-Host "already installed" -ForegroundColor Green; } }
[string]$command = '"C:\Program Files\Vim\vim74\gvim.exe" --windowid !ConEmuBackHWND! -new_console:s50H';
[String]$prompt = ">"
function global:Windows-Vim {
    Invoke-Expression "& $command"
}
Set-Alias vim Windows-Vim
function prompt {
    $prompt
}
