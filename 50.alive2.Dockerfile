run apt install -y re2c \
    && git clone --depth 1 https://github.com/AliveToolkit/alive2 \
    && cd alive2 \
    && mkdir build && cd build \
    && cmake -GNinja -DLLVM_DIR=/llvm-project/build/lib/cmake/llvm -DCLANG_PLUGIN=1 -DBUILD_TV=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. \
    && ninja install
