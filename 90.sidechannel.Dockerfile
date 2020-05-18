run mkdir sidechannel \
    && cd sidechannel \
    && git clone --depth 1 https://github.com/SideChannelMarvels/Tracer \
    && apt-get install -y automake libcapstone-dev libsqlite3-dev \
    && cd Tracer/TracerGrind \
    && wget https://sourceware.org/pub/valgrind/valgrind-3.15.0.tar.bz2 \
    && tar xf valgrind-3.15.0.tar.bz2 \
    && cp -r tracergrind valgrind-3.15.0/ \
    && patch -p0 < valgrind-3.15.0.diff \
    && cd valgrind-3.15.0/ \
    && ./autogen.sh \
    && ./configure --prefix=/usr \
    && make -j10 \
    && make install \
    && cd ../texttrace/ \
    && make \
    && make install

run cd sidechannel \
    && git clone --depth 1 https://github.com/SideChannelMarvels/Daredevil \
    # Install libomp if it can't be found
    && echo '#include <omp.h>' | cpp -H -o /dev/null &>/dev/null || apt-get install -y libomp-dev \
    && cd Daredevil \
    && make -j \
    && make install

run cd sidechannel \
    && git clone --depth 1 https://github.com/SideChannelMarvels/Deadpool \
    && apt-get install -y python python-pip
