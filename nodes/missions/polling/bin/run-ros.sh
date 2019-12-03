#!/bin/bash
ID=$1
MISSION=$2
ROLE=$3
cd ~/catkin_ws
roslaunch src/evins_nodes/missions/$MISSION/launch/$ROLE.launch vehicle_name:=lv$ID vehicle_id:=$ID real:=false bags:=false
