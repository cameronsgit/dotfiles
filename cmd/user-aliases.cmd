;= @echo off
;= rem Call doskey and use this file as the macrofile
;= %SystemRoot%\System32\doskey /listsize=1000 /macrofile=%0%
;= goto:eof
;= Add aliases below here

unalias=alias /d $1
realias=alias /reload
vim=wsl vim $*
ls=wsl ls --color=always
