#!/bin/bash

DRONE_SWARM_MEMBERS=$1
MAV_NAME="hummingbird_adr"
export APPLICATION_PATH=${PWD}

if [ -z $DRONE_SWARM_MEMBERS ] # Check if DRONE_SWARM_MEMBERS is NULL
  then
  	#Argument 1 empty
    	echo "-Setting Swarm Members = 1"
    	DRONE_SWARM_MEMBERS=1
  else
    	echo "-Setting DroneSwarm Members = $1"
fi

gnome-terminal  \
   	--tab --title "airplane" --command "bash -c \"
roslaunch ${APPLICATION_PATH}/configs/gazebo_files/launch/AirbusA310.launch project:=${APPLICATION_PATH};
exec bash\""  &

sleep 3

for (( c=1; c<=$DRONE_SWARM_MEMBERS; c++ )) 
do  
  gnome-terminal  \
  --tab --title "Spawn_mav" --command "bash -c \"
  roslaunch rotors_gazebo spawn_mav.launch --wait \
    namespace:=$MAV_NAME$c \
    mav_name:=$MAV_NAME \
    log_file:=$MAV_NAME$c;
  exec bash\""  &
done

