shell ["/bin/bash", "-c"]
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -y \
    # Essentials:
        automake \
        fd-find \
        git \
        python3-pip \
        silversearcher-ag \
        tig \
        tmux \
        vim
