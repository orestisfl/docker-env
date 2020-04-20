run apt-get install -y libtool \
    && git clone --depth 1 https://github.com/csmith-project/csmith \
    && cd csmith \
    && autoreconf -fi \
    && ./configure --prefix=/usr \
    && make install -j10 \
    && make install -C runtime install -j
