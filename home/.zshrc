
autoload -Uz compinit promptinit
compinit
promptinit

bindkey $'\E[1;5D' vi-backward-blank-word
bindkey $'\E[1;5C' vi-forward-blank-word

zstyle ':completion:*' menu select

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export PAGER=cat
export LANG=de_DE.UTF-8
export TEMPDIR=/var/tmp
export TMPDIR=/var/tmp
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin:$HOME/bin/:$HOME/.local/bin:$HOME/go/bin:$HOME/.kube/plugins/jordanwilson230
export PS1='%{%F{magenta}%}%n%{%f%}%{%F{cyan}%}@%{%f%}%{%F{yellow}%}%m%{%f%}:%~%(#.#.$) '
alias l='ls --color --all --classify'
alias ll='ls --color --all --classify -l'
alias o='less'
alias p='ps fax'
alias d='du -m -c -s * | sort -n'
alias sy='tail -f /var/log/syslog'
alias shoot="killall -9 "
alias memo='vi $HOME/.memo'
alias lathspell-dvdbackup='dvdbackup -v -M -i /dev/sr0 -o .'
alias k=kubectl

export SDKMAN_DIR="/home/cb/.sdkman"
[[ -s "/home/cb/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cb/.sdkman/bin/sdkman-init.sh"

# vim: ts=4
