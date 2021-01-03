run apt-get install -y libtool \
    && git clone --depth 1 https://github.com/csmith-project/csmith \
    && cd csmith \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr . \
    && make install -j \
    && make install -C runtime install -j
