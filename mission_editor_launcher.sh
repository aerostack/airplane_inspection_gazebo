#!/bin/bash

NUMID_DRONE=111
export AEROSTACK_PROJECT=${AEROSTACK_STACK}/projects/airplane_inspection_gazebo

. ${AEROSTACK_STACK}/config/mission/setup.sh

gnome-terminal \
--tab --title "Behavior Tree Editor" --command "bash -c \"
roslaunch behavior_tree_editor behavior_tree_editor.launch --wait \
  robot_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  my_stack_directory:=${AEROSTACK_PROJECT} \
  mission_config_path:=${AEROSTACK_PROJECT}/configs/mission \
  catalog_path:=${AEROSTACK_PROJECT}/configs/mission/behavior_catalog.yaml;
exec bash\""  &
