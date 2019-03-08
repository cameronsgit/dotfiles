#!/usr/bin/env pwsh

using namespace System;

[string] $extensionFile = Get-Content -Raw "$($PSScriptRoot)/vscode.txt" | Out-String;
[string[]] $extensionList = $extensionFile.Split([Environment]::NewLine);

foreach ($extension in $extensionList) {
    code --install-extension $extension;
}

exit;
