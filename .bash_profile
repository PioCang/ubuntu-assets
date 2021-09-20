                            ### Typical command line ###

# PROMPT_COMMAND is a special variable that's evaluated each time you enter/return to the shell from.
function __ps1_newline_login {
    export PS1="\e[1;33m\! \e[1;32m\u\e[0;37m@\e[0;30;47m\H\e[1;37m\e[0;37m [\e[1;31m\t\e[0;37m] <$(git branch 2>/dev/null | grep '^*' | colrm 1 2)>\n  \e[1;36m\w/\e[0;37m\n\$ "
}

PROMPT_COMMAND='__ps1_newline_login'


# Disable XOFF (Ctrl + S) from hindering input.
stty -ixon


# Every time you delete, ask for confirmation if overwrite is needed and be verbose about it.
alias rm='rm -i -v'

# Every time you copy ask for confirmation if overwrite is needed and be verbose about it.
alias cp='cp -i -v'

# Every time you move/rename, ask for confirmation if overwrite is needed and be verbose about it.
alias mv='mv -i -v'

# Colorize filelisting
alias ll='ls -al --color=auto'

# Vim
alias v='vim -b'

# Everytime you change directory, list all the files right away.
# But if directory doesn't exist, show the error message.
ChangeDirAndList() {
    if [[ -d $PWD'/'$1 || -d $1 ]]; then
        cd $1
        ls -al --color=auto
    else
        cd $1
    fi
}
alias c=ChangeDirAndList

# Find pattern $1 in subdirectories then color them with grep.
FindAndColor() {
    find . -iname *$1* -print | grep -i --color=always $1
}
alias gf=FindAndColor

# Find pattern $1 in the filelisting of the current directory
ListAndGrep() {
    if [[ -z $2 ]]; then
        ls -alt | grep -i --color=always $1
    else
        ls -alt $1 | grep -i --color=always $2
    fi
}
alias gl=ListAndGrep

# Find pattern in history log
alias gh='history | grep -i --color=always'

# Find string recursively starting from current dir; case-insenstive
GrepCat() {
    grep -irPn "$1" --color=always
}
alias gc=GrepCat

alias dev='c ~/Desktop/erpnext-docker-debian/development_setup/data/bench/apps/'

                            ### Docker commands ###
alias dcu='sudo docker-compose up -d'
alias dcstart='sudo docker-compose start'
alias dcstop='sudo docker-compose stop'
alias dp='sudo docker ps'

DockerExec() {
    sudo docker exec -it $1 bash
}
alias de=DockerExec


                            ### Python ###
alias python='python3'
source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python'
export WORKON_HOME=~/.virtualenvs
