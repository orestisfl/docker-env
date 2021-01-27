shell ["/bin/bash", "-c"]
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -y \
    # Essentials:
        automake \
        build-essential \
        cmake \
        fd-find \
        git \
        ipython3 \
        ninja-build \
        python3 \
        python3-pip \
        silversearcher-ag \
        tig \
        tmux \
        vim
