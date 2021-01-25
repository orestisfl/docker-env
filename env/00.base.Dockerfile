shell ["/bin/bash", "-c"]
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -y \
    # Essentials:
        automake \
        build-essential \
        cmake \
        git \
        ipython3 \
        ninja-build \
        python3 \
        python3-pip \
        silversearcher-ag \
        tig \
        tmux \
        vim \
    # Install latest node: https://github.com/nodesource/distributions#debinstall
    && curl -sL https://deb.nodesource.com/setup_current.x | bash \
    && apt-get install -y nodejs \
    && npm install npm@latest -g \
    # https://docs.npmjs.com/updating-packages-downloaded-from-the-registry
    && npm update -g \
    && npm install -g \
        # https://github.com/tldr-pages/tldr
        tldr \
    # https://github.com/sharkdp/fd
    && wget https://github.com/sharkdp/fd/releases/download/v7.5.0/fd_7.5.0_amd64.deb && dpkg -i fd_7.5.0_amd64.deb && rm *.deb
