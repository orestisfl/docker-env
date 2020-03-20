add valgrind-3.15.0.diff sidechannel/3.15.diff
run cd sidechannel \
    && git clone --depth 1 https://github.com/SideChannelMarvels/Tracer \
    && apt-get install -qqy automake libcapstone-dev libsqlite3-dev \
    && cd Tracer/TracerGrind \
    && wget https://sourceware.org/pub/valgrind/valgrind-3.15.0.tar.bz2 \
    && tar xf valgrind-3.15.0.tar.bz2 \
    && cp -r tracergrind valgrind-3.15.0/ \
    && patch -p0 < /sidechannel/3.15.diff \
    && cd valgrind-3.15.0/ \
    && ./autogen.sh \
    && ./configure --prefix=/usr \
    && make -j10 \
    && make install \
    && cd ../texttrace/ \
    && make \
    && make install PREFIX=/usr

run cd sidechannel \
    && git clone --depth 1 https://github.com/SideChannelMarvels/Daredevil \
    && apt-get install -qqy libomp-dev \
    && cd Daredevil \
    && make -j \
    && make install PREFIX=/usr

run cd sidechannel \
    && git clone --depth 1 https://github.com/SideChannelMarvels/Deadpool \
    && apt install -qqy python python-pip
