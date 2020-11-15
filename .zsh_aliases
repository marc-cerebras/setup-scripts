#!/bin/bash

## COMMON
alias cp='cp -iv' 
alias mv='mv -iv' 
alias mkdir='mkdir -pv' 
alias ll='ls -FGlAhp' 
alias la='ls -A'
alias l='ls -CF'
alias less='less -FSRXc' 
alias cd..='cd ../' 
alias ~="cd ~" 
alias c='clear' 
alias which='type -all' 
alias path='echo -e ${PATH//:/\\n}' 
alias show_options='shopt' 

## HELPERS
alias isodate='date --iso-8601=seconds'
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]"'
alias nuuid='echo -ne 00000000-0000-0000-0000-000000000000 | tr -d "\n"'
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1   ;;
            *.tar.gz)  tar xzf $1   ;;
            *.bz2)    bunzip2 $1   ;;
            *.rar)    unrar e $1   ;;
            *.gz)    gunzip $1   ;;
            *.tar)    tar xf $1   ;;
            *.tbz2)   tar xjf $1   ;;
            *.tgz)    tar xzf $1   ;;
            *.zip)    unzip $1    ;;
            *.Z)     uncompress $1 ;;
            *.7z)    7z x $1    ;;
            *)   echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

## SEARCH 
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/  /'\'' -e '\''s/-/|/'\'' | less'
alias qfind="find . -name " 
ff () { /usr/bin/find . -name "$@" ; } 
ffs () { /usr/bin/find . -name "$@"'*' ; } 
ffe () { /usr/bin/find . -name '*'"$@" ; }

## SYSTEM 
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
findPid () { lsof -t -c "$@" ; }
alias mem_hogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10' 

## NETWORK
alias net_conns='lsof -i' 
alias lsock='sudo /usr/sbin/lsof -i -P' 
alias lsocku='sudo /usr/sbin/lsof -nP | grep UDP' 
alias lsockt='sudo /usr/sbin/lsof -nP | grep TCP' 
alias ipInfo0='ipconfig getpacket en0' 
alias open_ports='sudo lsof -i | grep LISTEN' 
alias show_blocked='sudo ipfw list' 
