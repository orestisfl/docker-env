# Install latest node: https://github.com/nodesource/distributions#debinstall
run curl -sL https://deb.nodesource.com/setup_current.x | bash \
    && apt-get install -y nodejs \
    && npm install npm@latest -g \
    # https://docs.npmjs.com/updating-packages-downloaded-from-the-registry
    && npm update -g

# Lucet: https://bytecodealliance.github.io/lucet/Compiling-on-Linux.html
add https://sh.rustup.rs rustup.sh
env PATH=/root/.cargo/bin:$PATH
run apt-get install -y curl ca-certificates cmake \
    && curl -sS -L -O https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-12/wasi-sdk_12.0_amd64.deb \
    && dpkg -i *.deb && rm -f *.deb \
    && chmod +x rustup.sh && ./rustup.sh -y \
    && git clone https://github.com/bytecodealliance/lucet \
    && cd lucet/ \
    && git submodule update --init --recursive \
    && make install PREFIX=/usr -j

# wasmer: https://wasmer.io/
add https://get.wasmer.io wasmer.sh
run sh wasmer.sh

# emscripten: https://emscripten.org/docs/getting_started/downloads.html
run git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && echo '# source /emsdk/emsdk_env.sh' >> ~/.profile

# binaryen: https://github.com/WebAssembly/binaryen
run git clone --depth 1 https://github.com/WebAssembly/binaryen \
    && cd binaryen \
    && mkdir build && cd build \
    && cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .. \
    && ninja install

# wabt: https://github.com/WebAssembly/wabt
run git clone --recursive https://github.com/WebAssembly/wabt \
    && cd wabt \
    && mkdir build && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
    && make install -j

# wasmtime: https://github.com/bytecodealliance/wasmtime
run curl https://wasmtime.dev/install.sh -sSf | bash

# wasm-trace: https://github.com/wasm3/wasm-trace
run npm install -g https://github.com/orestisfl/wasm-trace

# swam: https://github.com/satabin/swam
run apt-get install -y default-jdk \
    && git clone https://github.com/satabin/swam \
    && cd swam \
    && ./millw all _.assembly
