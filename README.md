# Application: airplane_inspection_gazebo

This application illustrates how a drone inspects the surface of an airplane. The mission is formulated as a behavior tree. During the mission execution, it is possible to pause and continue the mission execution. While the mission is paused, the user can teleoperate manually the drone using the keyboard.

In order to execute the mission, perform the following steps:

- Execute the script that launches Gazebo for this project:

        $ ./launcher_gazebo.sh

- Wait until the following window is presented:

<img src="https://github.com/aerostack/airplane_inspection_gazebo/blob/master/doc/AirplaneInspectionFirstImage.png" width=600>

- Execute the script that launches the Aerostack components for this project:

        $ ./main_launcher.sh

As a result of this command, a set of windows are presented to monitor the execution of the mission. These windows include:
- Alphanumeric behavior viewer
- Belief viewers 
- Image view of the front cameras

In order to start the execution of the mission, press the button "start mission" (window behavior tree interpreter). The mission is previously stored as a behavior tree in configs/mission/behavior_tree_mission_file.yaml

The following video illustrates how to launch the project:

[ ![Launch](https://i.ibb.co/jh7j3Z7/ibb1.png)](https://youtu.be/sYY57W2C9sM)

The following video shows the complete execution with the image of the front camera:

[ ![Using camera](https://i.ibb.co/wyBN1bS/ibb2.png)](https://youtu.be/XHyt1IYAgz4)

The following video shows the content of belief memory viewer and the alphanumeric behavior execution viewer during the mission execution:
  
[ ![Airplane inspection gazebo](https://i.ibb.co/k1xNtzt/ibb3.png)](https://youtu.be/5h8I0axevM4)

The following video shows the execution of the mission with subtitles while using teleoperation:

[ ![Airplane inspection gazebo with subtitles](https://i.ibb.co/DRQKPw2/capiavion2-800.png)](https://youtu.be/3l02MxyfGow)
