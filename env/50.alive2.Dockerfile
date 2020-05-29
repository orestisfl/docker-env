run apt-get install -y re2c \
    && git clone --depth 1 https://github.com/AliveToolkit/alive2 \
    && cd alive2 \
    && mkdir build && cd build \
    && export CC=clang \
    && clang --version \
    && cmake -GNinja -DLLVM_DIR=/llvm-project/build/lib/cmake/llvm -DCLANG_PLUGIN=1 -DBUILD_TV=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-Wno-error" .. \
    && ninja install
