FROM osrf/ros:melodic-desktop-full

SHELL ["/bin/bash", "-c"] 

RUN sudo apt update -y && sudo apt upgrade -y \
&& sudo apt install -y curl apt-utils wget gnupg2 lsb-release git meld build-essential libfontconfig1 mesa-common-dev libglu1-mesa-dev libglfw3-dev libglfw3

# the foxy branch is most up to date and has . however the Optimization Based Planning example uses ros melodic
RUN git clone -b foxy https://github.com/alandelira415/industrial_training.git ~/industrial_training

RUN cd ~/industrial_training \
&& cp -r ~/industrial_training/exercises/Optimization_Based_Planning/template_ws ~/optimized_planning_ws \
&& cd ~/optimized_planning_ws 

RUN sudo apt-get install -y ros-melodic-catkin python3-catkin-tools

RUN cd ~/optimized_planning_ws/src/ \
&& wstool update \
&& rosdep install --from-paths . --ignore-src -y -r


RUN cd ~/optimized_planning_ws/ \
&& source /opt/ros/melodic/setup.bash \
&& catkin build --cmake-args -DCMAKE_BUILD_TYPE=Release\
&& source devel/setup.bash

CMD ["/bin/bash"]
