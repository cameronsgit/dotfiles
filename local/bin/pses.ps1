#!/usr/bin/env pwsh

Start-EditorServicesHost -HostName 'VIM' -HostProfileId 'VIM' -HostVersion '1.10.2'  -LogLevel 'Normal' -LogPath '/tmp/pses.log' -Stdio
