#!/bin/bash

NUMID_DRONE=1
NETWORK_ROSCORE=$1
SESSION=$USER
UAV_MASS=1.5

mv $AEROSTACK_WORKSPACE/develIgnore $AEROSTACK_WORKSPACE/devel
export APPLICATION_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Kill any previous session (-t -> target session, -a -> all other sessions )
tmux kill-session -t $SESSION
tmux kill-session -a

# Create new session  (-2 allows 256 colors in the terminal, -s -> session name, -d -> not attach to the new session)
tmux -2 new-session -d -s $SESSION

# Create one window per roslaunch (-t -> target session , -n -> window name) 
tmux new-window -t $SESSION:1 -n 'viewer + teleop'
tmux send-keys "roslaunch alphanumeric_viewer alphanumeric_viewer.launch --wait \
    drone_id_namespace:=drone$NUMID_DRONE \
    my_stack_directory:=${APPLICATION_PATH}" C-m

tmux split-window -t $SESSION:1
tmux send-keys  "roslaunch keyboard_teleoperation_with_pid_control keyboard_teleoperation_with_pid_control.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE" C-m
            
tmux new-window -t $SESSION:2 -n 'pixhawk interface'
tmux send-keys "roslaunch pixhawk_interface pixhawk_interface.launch \
--wait drone_id_namespace:=drone$NUMID_DRONE acro_mode:=false simulation_mode:=true " C-m

tmux new-window -t $SESSION:3 -n 'Basic Quadrotor Behaviors'
tmux send-keys "roslaunch basic_quadrotor_behaviors basic_quadrotor_behaviors.launch --wait \
  namespace:=drone$NUMID_DRONE" C-m

tmux new-window -t $SESSION:4 -n 'Quadrotor Motion With PID Control'
tmux send-keys "roslaunch quadrotor_motion_with_pid_control quadrotor_motion_with_pid_control.launch --wait \
    namespace:=drone$NUMID_DRONE \
    robot_config_path:=${APPLICATION_PATH}/configs/drone$NUMID_DRONE \
    uav_mass:=$UAV_MASS" C-m

tmux new-window -t $SESSION:5 -n 'GroundTruth Gazebo'
tmux send-keys "rosrun topic_tools relay /drone${NUMID_DRONE}/mavros/local_position/pose /drone${NUMID_DRONE}/self_localization/pose & \
rosrun topic_tools relay drone${NUMID_DRONE}/mavros/local_position/velocity_local /drone${NUMID_DRONE}/self_localization/speed" C-m

tmux new-window -t $SESSION:6 -n 'Throttle_Controller'
tmux send-keys "roslaunch thrust2throttle_controller thrust2throttle_controller.launch --wait \
  namespace:=drone$NUMID_DRONE \
  uav_mass:=$UAV_MASS" C-m

tmux new-window -t $SESSION:7 -n 'Python interpreter'
tmux send-keys "roslaunch python_based_mission_interpreter_process python_based_mission_interpreter_process.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id_int:=$NUMID_DRONE \
  my_stack_directory:=${APPLICATION_PATH} \
  mission:=mission_pid.py \
  mission_configuration_folder:=${APPLICATION_PATH}/configs/mission" C-m

tmux new-window -t $SESSION:8 -n 'Behavior Coordinator'
tmux send-keys "roslaunch behavior_coordinator behavior_coordinator.launch --wait \
  robot_namespace:=drone$NUMID_DRONE \
  catalog_path:=${APPLICATION_PATH}/configs/mission/behavior_catalog.yaml" C-m

tmux new-window -t $SESSION:9 -n 'Behavior Tree Interpreter'
tmux send-keys "roslaunch behavior_tree_interpreter behavior_tree_interpreter.launch --wait \
  robot_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  mission_configuration_folder:=${APPLICATION_PATH}/configs/mission \
  catalog_path:=${APPLICATION_PATH}/configs/mission/behavior_catalog.yaml" C-m

tmux new-window -t $SESSION:10 -n 'Belief memory Viewer'
tmux send-keys "roslaunch belief_memory_viewer belief_memory_viewer.launch --wait \
  robot_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE" C-m

tmux new-window -t $SESSION:11 -n 'Belief memory Viewer'
tmux send-keys "roslaunch belief_manager_process belief_manager_process.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  config_path:=${APPLICATION_PATH}/configs/mission" C-m

tmux new-window -t $SESSION:12 -n 'Belief memory Viewer'
tmux send-keys "roslaunch common_belief_updater_process common_belief_updater_process.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE" C-m

tmux new-window -t $SESSION:12 -n 'Belief memory Viewer'
tmux send-keys "roslaunch alphanumeric_behavior_viewer alphanumeric_behavior_viewer.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  catalog_path:=${APPLICATION_PATH}/configs/mission/behavior_catalog.yaml" C-m

tmux new-window -t $SESSION:13 -n 'Alphanumeric Behavior Viewer'
tmux send-keys "roslaunch alphanumeric_behavior_viewer alphanumeric_behavior_viewer.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  catalog_path:=${APPLICATION_PATH}/configs/mission/behavior_catalog.yaml" C-m

tmux new-window -t $SESSION:14 -n 'Behavior Coordinator Logger'
tmux send-keys "roslaunch behavior_coordinator_logger behavior_coordinator_logger.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE" C-m

tmux new-window -t $SESSION:15 -n 'Camera Raw'
tmux send-keys "rqt_image_view /iris/usb_cam/image_raw" C-m

tmux attach-session -t $SESSION:1


