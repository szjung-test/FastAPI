FROM nvcr.io/nvidia/tensorrt:22.05-py3

SHELL ["/bin/bash", "-c"]

# Setup user account
# id -g, id -u
ARG uid=1007
ARG gid=1007
RUN groupadd -r -f -g ${gid} szjung && useradd -o -r -l -u ${uid} -g ${gid} -ms /bin/bash szjung
RUN usermod -aG sudo szjung
RUN echo 'szjung:szjung1' | chpasswd
RUN mkdir -p /workspace && chown szjung /workspace

# Required to build Ubuntu 20.04 without user prompts with DLFW container
ENV DEBIAN_FRONTEND=noninteractive

# install
RUN apt-get update && apt-get install -y sudo
RUN apt-get install -y libgl1-mesa-glx
RUN apt-get install -y git


# locale Korean
RUN apt-get install -y locales
RUN locale-gen ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

WORKDIR /workspace

USER szjung
RUN ["/bin/bash"]