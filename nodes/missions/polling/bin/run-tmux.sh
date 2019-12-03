#!/bin/bash

BASE=/opt/evins
LOGS=$BASE/log
ETC=$BASE/etc
SESSION_NAME=am-evins

CONF=/tmp/run-evins-all.tmux.conf
if tmux ls | grep -qw "^$SESSION_NAME"; then
    echo "tmux session $SESSION_NAME already run" 1>&2
    exit 1 
fi

ID=$1
NAME=lv$ID
MISSION=$2
ROLE=$3

IPPRE=$(cat /etc/hosts|grep lv1|uniq|sed -ne 's/\([0-9]*\.[0-9]*\.[0-9]*\.\).*/\1/p')
$ETC/gen $IPPRE $ID
rm -rf $CONF

echo -n "new-session -d -s $SESSION_NAME " > $CONF
echo "-n evins \"/opt/bin/run-evins.sh $ID | tee $LOGS/fsm-$i.%Y%m%d.log \"" >> $CONF
echo -n "new-window -d -t $SESSION_NAME " >> $CONF
echo "-n ros \"/opt/bin/run-ros.sh $ID $MISSION $ROLE \"" >> $CONF
echo "select-window -t ros" >> $CONF

exec tmux source-file $CONF \; att -t $SESSION_NAME

