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
        silversearcher-ag \
        software-properties-common \
        tig \
        tmux \
        vim \
        wget \
    # Install latest node: https://github.com/nodesource/distributions#debinstall
    && curl -sL https://deb.nodesource.com/setup_13.x | bash \
    && apt-get install -y nodejs \
    && npm install npm@latest -g \
    # https://docs.npmjs.com/updating-packages-downloaded-from-the-registry
    && npm update -g \
    && npm install -g \
        # https://github.com/sharkdp/fd
        fd-find \
        # https://github.com/tldr-pages/tldr
        tldr
