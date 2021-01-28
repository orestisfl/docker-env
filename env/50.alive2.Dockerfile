run apt-get install -y re2c z3 libz3-dev \
    && git clone --depth 1 https://github.com/AliveToolkit/alive2 \
    && cd alive2 \
    && mkdir build && cd build \
    && cmake -GNinja -DCMAKE_PREFIX_PATH=/llvm-project/build -DBUILD_TV=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-Wno-error" .. \
    && ninja install
