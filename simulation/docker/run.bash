#!/bin/bash

# Written by Nikolay Dema <ndema2301@gmail.com>, September 2022

SIM_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

xhost +local:docker > /dev/null || true

IMG_NAME="nickodema/hsl_2022"
GPU_FLAG=""

### Check if NVIDIA GPU flag is needed ----------------------------------- #

if [ -n "$(which nvidia-smi)" ] && [ -n "$(nvidia-smi)" ]; then
    GPU_FLAG=(--gpus all)
    IMG_NAME="${IMG_NAME}:nvidia"
else
    IMG_NAME="${IMG_NAME}:updated"
fi


### DOCKER RUN ----------------------------------------------------------- #

docker run  ${GPU_FLAG[@]} \
            -d -ti --rm \
            -e "DISPLAY" \
            -e "QT_X11_NO_MITSHM=1" \
            -e XAUTHORITY \
            -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
            -v /etc/localtime:/etc/localtime:ro \
            -v ${SIM_ROOT}/workspace:/workspace \
            --net=host \
            --privileged \
            --name "hsl_2022" ${IMG_NAME} \
            > /dev/null
