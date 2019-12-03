#!/bin/bash
set -e

# evins specific configuration
cat /root/hosts >> /etc/hosts
source /opt/ros/indigo/setup.bash
if [ -e /root/catkin_ws/devel/setup.bash ]; then
  source /root/catkin_ws/devel/setup.bash
fi
exec "$@"
