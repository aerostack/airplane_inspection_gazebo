This project illustrates how a drone inspects the surface of an airplane. The mission is formulated as a behavior tree. During the mission execution, it is possible to pause and continue the mission execution. While the mission is paused, the user can teleoperate manually the drone using the keyboard.

In order to execute the mission, perform the following steps:

- Execute the script that launches Gazebo for this project:

        $ ./launcher_gazebo.sh

- Wait until the following window is presented:

[[Files/AirplaneInspectionFirstImage.png]]

- Execute the script that launches the Aerostack components for this project:

        $ ./main_launcher.sh

As a result of this command, a set of windows are presented to monitor the execution of the mission. These windows include:
- Behavior execution viewer
- Belief viewers 
- Image view of the front cameras

In order to start the execution of the mission, press the button "start mission" (window behavior tree interpreter). The mission is previously stored as a behavior tree in configs/mission/behavior_tree_mission_file.yaml

The following video illustrates how to launch the project:

[ ![Launch](https://i.ibb.co/4SrqBPY/youtubepage1-800.png)](https://youtu.be/xETjawUBR2M)

The following video shows the complete execution with the image of the front camera:

[ ![Using camera](https://i.ibb.co/2d0JHgK/youtubepage2-800.png)](https://youtu.be/nVDlk8b8eyk)

The following video shows the content of belief memory viewer and behavior execution viewer during the mission execution:
  
[ ![Airplane inspection gazebo](https://i.ibb.co/zhwk4jB/youtubepage3-800.png)](https://youtu.be/mPCTLPO-F_A)

The following video shows the execution of the mission with subtitles while using teleoperation:

[ ![Airplane inspection gazebo with subtitles](https://i.ibb.co/DRQKPw2/capiavion2-800.png)](https://youtu.be/3l02MxyfGow)
