# TANKBOT_V0
Modular robot with 4x4 traction for learning robotics.
> [!IMPORTANT]
> Descontinued.

## Table of Contents
- [TANKBOT\_V0](#tankbot_v0)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [BOM](#bom)
  - [Electronics](#electronics)
    - [Jetson Nano Devkit](#jetson-nano-devkit)
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
This project is designed to be a robot that allows learning robotics, from simple control with ROS to autonomous operation with Lidar or cameras.

## BOM
> [!IMPORTANT]
> This section is under construction.

Table of electronic components:
| Component | Quantity | Link |
|------------|----------|------|
| Jetson Nano Devkit | 1 | [Link](https://developer.nvidia.com/embedded/jetson-nano-developer-kit) |
| DC Motor 12V 421RPM 21.6W | 2 | [Link](https://www.aliexpress.com/item/1005005428153048.html) |
| 10A Dual DC Motor Drive Module | 1 | [Link](https://aliexpress.com/item/1005005600656370.html) |
| 3S 1500mAh LiPo Battery | 2 | [Link](https://chinahobbyline.com/collections/cnhl-voltage-11-1v-3s-lipo-batteries/products/cnhl-black-series-1500mah-11-1v-3s-100c-lipo-battery-with-xt60-plug) |
| RP Lidar C1 | 1 | [Link](https://www.slamtec.ai/product/slamtec-rplidar-c1/) |
| MPU6050 | 1 | [Link](https://www.aliexpress.com/item/1005005281279590.html) |
| ELRS 2.4Ghz RX | 1 | [Link](https://www.aliexpress.com/item/1005005912449261.html) |

Table of mechanical components:
| Component | Quantity | Link |
|------------|----------|------|
| 2GT Timing Pulley 16 Teeth Bore 5mm | 4 | [Link](https://www.aliexpress.com/item/1005003693756433.html) |
| 2GT Timing Pulley 20 Teeth Bore 8mm | 2 | [Link](https://www.aliexpress.com/item/1005003693756433.html) |
| 2GT Idler Timing Pulley 20 Teeth Bore 5mm | 2 | [Link](https://www.aliexpress.com/item/32817328238.html) |
| 2GT 6mm Closed Loop Rubber Timing Belt 340mm | 2 | [Link](https://www.aliexpress.com/item/1005003420210494.html) |


Table of 3D printing components:
| Component | Quantity |
|------------|----------|
| base_link | 1 |

## Electronics
### Jetson Nano Devkit
This component is intended for robotics development, allowing real-time AI usage locally.

### Battery
Two 3S 1500mAh LiPo batteries are chosen in parallel to power the robot. These batteries are lightweight with a high discharge capacity and compact size. Possibly, they will be changed to Li-Ion cells which have higher energy density and are safer.

### Lidar
Lidar is a sensor that allows mapping the area where the robot is located. RP Lidar C1 model is chosen for its size and price.

### Camera
To be chosen...

### IMU
An MPU6050 will be used to obtain the orientation of the robot allowing corrections in the robot's movement.

### ELRS 2.4Ghz RX
A 2.4Ghz receiver has been added to remotely control the robot with a radio control transmitter.

## CAD
CAD files are provided so anyone can print the necessary parts to assemble the robot. Printing parameters will be explained later in a specific section. The robot has been designed in Fusion 360 following the guidelines of the [script](https://github.com/syuntoku14/fusion2urdf) to export a CAD design to urdf.
### Modules
The robot chassis has been designed to allow the addition of modules easily. Measurements for module creation will be provided soon.

## Simulator
The simulation will be carried out on a computer with an Nvidia graphics card. Therefore, a dockerfile has been created using the Cuda image provided by Nvidia and ROS Noetic installation has been added to the dockerfile.
Using the script in the CAD section, the CAD design has been exported to urdf to simulate the robot, initially using Gazebo.
### Gazebo
Coming soon...

## Operating System
Nvidia provides an Ubuntu 18.04 image with support for the Jetson Nano Devkit. To use ROS Noetic on the Jetson Nano Devkit, a [community-created image](https://forums.developer.nvidia.com/t/xubuntu-20-04-focal-fossa-l4t-r32-3-1-custom-image-for-the-jetson-nano/121768) has been used.

## ROS
ROS Noetic has been chosen for this version of the robot due to the amount of information and support it has compared to ROS Kinetic. A script will be provided to install ROS Noetic on the Jetson Nano Devkit.