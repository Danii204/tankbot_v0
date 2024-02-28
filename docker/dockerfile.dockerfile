FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04

# Install packages without prompting the user to answer any questions
ENV DEBIAN_FRONTEND noninteractive 

# Install packages
RUN apt-get update && apt-get install -y \
locales \
lsb-release \
mesa-utils \
git \
gedit \
subversion \
nano \
xterm \
wget \
curl \
htop \
libssl-dev \
build-essential \
dbus-x11 \
software-properties-common \
gdb valgrind && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Install ROS Noetic
# Set up your sources.list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Set up your keys
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# Installation
RUN apt-get update && apt-get install ros-noetic-desktop-full -y
# Environment setup
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# Dependencies for building packages
RUN apt-get install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
# Initialize rosdep
RUN rosdep init && rosdep update
# Create a catkin workspace
RUN mkdir -p ~/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; catkin_init_workspace ~/catkin_ws/src'
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd ~/catkin_ws; catkin_make'
# Environment setup
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Install cmake 3.26.3
RUN git clone https://gitlab.kitware.com/cmake/cmake.git && \
cd cmake && git checkout tags/v3.26.3 && ./bootstrap --parallel=8 && make -j8 && make install && \
cd .. && rm -rf cmake

# Locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8