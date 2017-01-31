#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"

# source de catkin_ws
if [ -d "/catkin_ws" ]; then
  source /catkin_ws/devel/setup.bash
fi

# launch supervisord, daemonized
supervisord

exec $@
