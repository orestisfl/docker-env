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
    # Install latest node: https://docs.npmjs.com/updating-packages-downloaded-from-the-registry
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash \
    && source ~/.nvm/nvm.sh \
    && nvm install node \
    && npm install npm@latest -g \
    && npm update -g \
        # https://github.com/sharkdp/fd
        fd-find \
        # https://github.com/tldr-pages/tldr
        tldr
