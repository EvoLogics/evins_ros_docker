#
# Generic .zshenv file for zsh 2.7
#
# .zshenv is sourced on all invocations of the
# shell, unless the -f option is set.  It should
# contain commands to set the command search path,
# plus other important environment variables.
# .zshenv should not contain commands that product
# output or assume the shell is attached to a tty.
#

# THIS FILE IS NOT INTENDED TO BE USED AS /etc/zshenv, NOR WITHOUT EDITING
#return 0	# Remove this line after editing this file as appropriate

path=(/bin /sbin /usr/sbin /usr/local/sbin)
path=($path /usr/bin)
path=($path /usr/local/bin)
path=($path ~/bin)

BLOCKSIZE=K;    export BLOCKSIZE

EDITOR=vim;     export EDITOR
PAGER=less;     export PAGER

