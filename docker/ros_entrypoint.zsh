#!/bin/zsh
set -e

# evins specific configuration
cat /root/hosts >> /etc/hosts

# setup ros environment
source /opt/ros/indigo/setup.zsh
if [ -e /root/catkin_ws/devel/setup.zsh ]; then
    source /root/catkin_ws/devel/setup.zsh
fi

exec "$@"
