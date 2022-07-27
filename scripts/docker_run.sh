#/bin/bash
xhost +local:docker
sudo docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix:rw -e NVIDIA_VISIBLE_DEVICES=0 emika_trajopt:local /bin/bash