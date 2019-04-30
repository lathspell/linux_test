umask 022

[ -z "$PS1" ] && return;

shopt -s checkwinsize

export SVN_SSH='ssh -lchammers'
export LESS='-iMR'
export LS_OPTIONS='--color=auto'
export PAGER='less -s'
export PS1='\u@\h:\w\$ '

# if [ "$TERM" = "xterm" ]; then
#  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007\033]30;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
# fi

eval "`dircolors`"
eval "`lesspipe`"
. /etc/bash_completion

alias l='ls --color -CF -a'
alias ll='ls --color -CF -a -l'
alias p='ps fax'
alias '..'='cd ..'
alias o='less'
alias sy='tail -f /var/log/syslog'
alias sc='systemctl'
alias mp='mysqladmin processlist status'
alias ip6='echo; ip -o -6 addr | cut -d\\ -f1; echo; ip -6 route; echo'
