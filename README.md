# TANKBOT_V0
Modular 4x4 robot for learning robotics.

## Table of Contents
- [TANKBOT\_V0](#tankbot_v0)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [BOM](#bom)
  - [Electronics](#electronics)
    - [Jetson Nano Devkit](#jetson-nano-devkit)
    - [Motor](#motor)
    - [Driver](#driver)
    - [Voltage Regulator](#voltage-regulator)
    - [Battery](#battery)
    - [Lidar](#lidar)
    - [Camera](#camera)
    - [IMU](#imu)
    - [ELRS 2.4Ghz RX](#elrs-24ghz-rx)
  - [CAD](#cad)
    - [Modules](#modules)
  - [Simulator](#simulator)
    - [Gazebo](#gazebo)
  - [Operating System](#operating-system)
  - [ROS](#ros)

## Introduction
This project is designed to be a robot that allows learning robotics, from simple ROS control to autonomous navigation with Lidar or cameras.

## BOM
Insert table.

## Electronics
### Jetson Nano Devkit
This component is designed for robotics development, enabling real-time AI usage locally.

### Motor
Various options and characteristics have been considered when choosing brushed motors over brushless motors. Reasons:
- Price: Brushed motors are more cost-effective.
- Control Ease: Brushed motors are easier to control.
- Power: Brushed motors have more power compared to brushless motors of the same price.

### Driver
Choosing a driver that can control the motors and withstand the current spikes they may have is important. The chosen model meets the requirement of supporting current spikes and has a compact size.

### Voltage Regulator
To be filled...

### Battery
Two 3S 1500mAh LiPo batteries have been chosen in parallel to power the robot. These batteries are lightweight, have a high discharge rate, and are compact in size. There may be a switch to Li-Ion cell batteries, which have higher energy density and are safer.

### Lidar
Lidar is a sensor that allows mapping the area where the robot is located. The RP Lidar C1 model has been chosen for its size and price.

### Camera
To be filled...

### IMU
An MPU6050 will be used to obtain the robot's orientation, allowing corrections in the robot's movement.

### ELRS 2.4Ghz RX
A 2.4GHz receiver has been added to remotely control the robot with a radio control transmitter.

## CAD
CAD files are provided so that anyone can print the necessary parts to assemble the robot. Printing parameters will be explained later in a specific section. The robot has been designed in Fusion 360 following the guidelines of the script for exporting a CAD design to urdf.
Script link: [https://github.com/syuntoku14/fusion2urdf](https://github.com/syuntoku14/fusion2urdf)
### Modules
The robot's chassis has been designed to allow easy addition of modules. Measurements for creating the modules will be provided soon.

## Simulator
The CAD design has been exported to urdf to simulate the robot, initially using Gazebo.
### Gazebo
Coming soon...

## Operating System
Nvidia provides an Ubuntu 18.04 image with support for the Jetson Nano Devkit. To use ROS Noetic on the Jetson Nano Devkit, a community-created image has been used. Image link: [https://forums.developer.nvidia.com/t/xubuntu-20-04-focal-fossa-l4t-r32-3-1-custom-image-for-the-jetson-nano/121768](https://forums.developer.nvidia.com/t/xubuntu-20-04-focal-fossa-l4t-r32-3-1-custom-image-for-the-jetson-nano/121768)

## ROS
ROS Noetic has been chosen for this version of the robot due to the wealth of information and support it has over ROS Kinetic. A script will be provided to install ROS Noetic on the Jetson Nano Devkit.