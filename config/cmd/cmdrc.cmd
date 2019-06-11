:: vim: set ft=dosbatch: ::
@echo off

:: I'm using alias.bat located in %USERPROFILE%\bin\aliases.bat
doskey /macrofile=%USERPROFILE%\.dotfiles\cmd\user-aliases.cmd

:: System aliaes
doskey bin=cd %USERPROFILE%\bin
doskey ls=wsl ls --color=always
doskey vim=wsl vim $*
doskey pwd=wsl pwd
doskey open=explorer $*
