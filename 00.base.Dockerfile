from ubuntu:18.04

shell ["/bin/bash", "-c"]
env DEBIAN_FRONTEND=noninteractive
run apt-get update -qq \
    && apt-get dist-upgrade -qq \
    && apt-get install -qq \
    # Essentials:
        automake \
        build-essential \
        clang \
        cmake \
        curl \
        git \
        ipython3 \
        ninja-build \
        python3 \
        python3-pip \
        software-properties-common \
        tmux \
        wget
