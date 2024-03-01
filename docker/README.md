# Docker
This section will explain the usage of Docker in the project.
Docker is used to maintain a consistent development and production environment, as well as to have a development environment on any operating system.
We will install Docker on a host computer and not on the Jetson Nano, as we will simulate the robot on the host computer.

> [!NOTE]
> In this project, the host computer is running Windows 11, so there may be some differences in the usage of Docker on other operating systems.

## Table of Contents
- [Docker](#docker)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Building the Image](#building-the-image)
  - [Creating the Volume](#creating-the-volume)
  - [Creating the Container](#creating-the-container)
  - [GUI](#gui)

## Installation
To install Docker, the installer should be downloaded from the official Docker page: [Docker Desktop](https://www.docker.com/products/docker-desktop).
It is advisable to download graphics card drivers to enable hardware acceleration in the simulation; how to pass through the graphics card to Docker will be explained later.
Once the installer is downloaded, it should be executed and the steps indicated in the installer should be followed.
After Docker is installed, the computer should be restarted for the changes to take effect.

## Building the Image
Once the computer is restarted, Docker Desktop should be opened, and a terminal will be opened to start preparing the development environment. Then, download the provided dockerfile.dockerfile from this repository.
The dockerfile.dockerfile is the file that will be used to build the Docker image. This file specifies the base operating system, dependencies, and development environment.

To build the image, execute the following command in the terminal, but make sure to be in the folder where the dockerfile.dockerfile is located:
```bash
docker build -t <image_name> -f dockerfile.dockerfile .
```

Verify that the image has been built correctly with the following command:
```bash
docker images
```
The image we just built should appear.

## Creating the Volume
To share files between the host computer and the container, a volume must be created with the following command:
```bash
docker volume create <volume_name>
```

## Creating the Container
Once the image and the volume are created, the container should be created with the following command:
```bash
docker run -it -e DISPLAY=host.docker.internal:0.0 -v <volume_name>:/root/catkin_ws --net host --gpus=all --name <container_name> <image_name>
```
This command creates a container with the specified name, with the volume we created, and with access to the host computer's graphics card.

To exit the container, execute the following command:
```bash
exit
```

To re-enter the container, execute the following command:
```bash
docker exec -it <container_name> bash
```

To start the container, execute the following command:
```bash
docker start <container_name>
```

To stop the container, execute the following command:
```bash
docker stop <container_name>
```

## GUI
To use the graphical environment in the container, we will install an Xming server on the host computer. In this case, the program [XLaunch](https://sourceforge.net/projects/xming/) will be used. This will allow the container to use the graphical environment of the host computer.
When Xming is installed, run the program and follow the steps indicated in the installer.
Make sure XLaunch is running on "Multiple windows" and that the "Display number" option is set to 0; the rest of the options can be left as default.
> [!NOTE]
> Xming must be running for the container to use the graphical environment.