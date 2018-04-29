;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"

;= rem Custom settings

;= rem Directories
l=ls -lah --color $*

;= rem Python
;= rem python=winpty python.exe
pyclean=fnd.exe ./ \( -name "__pycache__" -o -name "*.pyc" -o -name "*.pyo" \) -prune -exec rm -rf {} +
virtualenv=virtualenv.exe $*
mkvirtualenv=mkvirtualenv.bat $*
rmvirtualenv=rmvirtualenv.bat $*
workon=workon.bat $*
deactivate=deactivate.bat
