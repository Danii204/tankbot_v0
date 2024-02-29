# Simulation
In this section, you will find the files and instructions to simulate the robot.
[Basic simulation video](https://youtu.be/CtObLVQea98)

> [!IMPORTANT]
> This section is under construction.

## Table of Contents
- [Simulation](#simulation)
  - [Table of Contents](#table-of-contents)
  - [Gazebo](#gazebo)
    - [Installation](#installation)
    - [First start](#first-start)

## Gazebo
Gazebo is a robot simulator that allows simulating robots in a 3D environment. It is possible to simulate robots with different sensors and actuators, as well as simulate their behavior.
So, it is a very useful tool for the development of our robot.

### Installation
The simulation will be performed on a computer using Docker. The docker section will explain how to install Docker and how to use the dockerfile, as well as how we can have a graphical interface to visualize the simulation.
Gazebo is already installed with the dockerfile provided in the docker section, but we need to pass the package to simulate the robot.
To pass the package named (tankbot_description) to the Docker image, first, we need to download it and with the following command, we pass it to the Docker image:
```bash
docker cp tankbot_description/ <container_id>:/root/catkin_ws/src
```
To use this command, we must be inside the directory containing the package (tankbot_description), and we must have the Docker container running.
With this, we are ready to run the simulation.

### First start
Once we are inside the Docker container, we can run the simulator with the following command:
```bash
roslaunch tankbot_gazebo gazebo.launch
```
A window should appear with the Gazebo simulator and the robot in the world we have created, if this does not happen, it is possible that the previous steps have not been followed correctly.

Now let's do a couple more checks to make sure everything is working correctly. Let's open a new terminal and run the following command:
```bash
rostopic list
```
We should see a list of the topics being published and their types. If the topic named /cmd_vel does not appear, the simulator may not have been executed correctly.

Next, let's open another new terminal and run the following command:
```bash
apt install ros-noetic-teleop-twist-keyboard
rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```
A message should appear in the terminal indicating how we can move the robot with the keyboard. Now we can move the robot with the keyboard keys and see how the robot moves in the simulator.

> [!TIP]
> We have to have clicked on "play" in the Gazebo window for the robot to move, and we must click on the terminal window we opened to move the robot with the keyboard.

If everything went well, we now have the Gazebo simulator running, and we can start working with it.