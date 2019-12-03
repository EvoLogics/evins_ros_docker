# zsh line editing
: ${ZSHEDIT:="emacs"}
: ${TERM:=linux}

fpath=(~/.zsh/function $fpath)

if [[ "$ZSHEDIT" == "vi" ]] then
    bindkey    -v
    bindkey -M viins '\e.' insert-last-word

    # kill from cursor till kill line in insert mode
    bindkey "^K" kill-line

    bindkey    "^P" history-beginning-search-backward
    bindkey    "^N" history-beginning-search-forward
else
    bindkey    -e
    bindkey    "^[ "	magic-space
    bindkey    "^[!"	expand-history
fi

#run help
bindkey -a K run-help

export NOCOLOR_PIPE=1

# Environment
HISTSIZE=5000
HISTFILE=${HOME}/.zsh_history
SAVEHIST=5000

autoload -U compinit
compinit -u ~

# Completion so "cd ..<TAB>" -> "cd ../"
zstyle ':completion:*' special-dirs ..

# Online help
unalias  run-help 2>/dev/null || true
autoload run-help

bindkey -v

autoload -U promptinit
promptinit

autoload -U zfinit
zfinit

#run help
bindkey -a K run-help

bindkey    "^[[A" history-beginning-search-backward
bindkey -a "^[[A" history-beginning-search-backward
bindkey    "^[[B" history-beginning-search-forward
bindkey -a "^[[B" history-beginning-search-forward

autoload -U edit-command-line
zle -N  edit-command-line

# Don't use zsh builtin which
#unalias which

# Set/unset  shell options
setopt   globdots nocorrect pushdtohome autolist
setopt   nocorrectall autocd recexact longlistjobs autoresume
setopt   histignoredups appendhistory histexpiredupsfirst
setopt   autopushd pushdminus extendedglob rcquotes
setopt   cdablevars # WORK=~/work/amm;cd WORK
setopt   noclobber #deny ">" truncate file
unsetopt bgnice autoparamslash hup pushdsilent

# Set prompts
source ~/.zsh_prompt

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

export PATH=$PATH:/sbin:/usr/sbin

# Watch for my friends
watch=(notme)                   # watch for everybody but me
LOGCHECK=300                    # check every 5 min for login/logout activity
WATCHFMT='%n %a %l from %m at %t.'

alias -g  GS='grep -r --include="*.[ch]"'

umask 002

alias l="ls -lh"
alias ls="ls -FA --color=auto"

autoload -U expand-dot
zle -N expand-dot
bindkey . expand-dot

mkd(){ mkdir -p "$1" && cd "$1"; }
rmd(){ local P="$PWD"; cd .. && rmdir $1 "$P" || cd "$P"; }

run-sudo() { BUFFER="sudo ${BUFFER}" }
autoload -U run-sudo
zle -N run-sudo
bindkey -a '!!' run-sudo

export TERM=xterm

source /opt/ros/indigo/setup.zsh
source /root/catkin_ws/devel/setup.zsh
export ROS_LANG_DISABLE=genlisp
export ROS_WORKSPACE=/root/catkin_ws
export ROSCONSOLE_FORMAT='[${severity}] [${time}]: ${node}: ${message}'
#alias catkin_make='roscd; catkin_make; cd $OLDPWD'

#source /opt/ros/indigo/setup.zsh
#test -e /root/catkin_ws/devel/setup.zsh && source /root/catkin_ws/devel/setup.zsh

cd /root/catkin_ws/
