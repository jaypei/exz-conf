#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion


# customer
export LC_MESSAGES="en_US.UTF-8"

alias grep="grep --color"
alias ls="/usr/bin/vendor_perl/ls++ --color --potsf"
export EDITOR=vim
export SVN_EDITOR=vim
# default
#PS1='[\u@\h \W]\$ '
# root
#PS1='\[\e[4;31m\]\u\[\e[0;34m\]$ \[\e[0m\]'
# user
export PS1='\[\e[0;35m\]\u\[\e[0;34m\] \w \$ \[\e[m\]'
cat /etc/motd




