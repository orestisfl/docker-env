# Lucet: https://bytecodealliance.github.io/lucet/Compiling-on-Linux.html
add https://sh.rustup.rs rustup.sh
env PATH=/root/.cargo/bin:$PATH
run apt-get install -qq curl ca-certificates cmake \
    && curl -sS -L -O https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk_8.0_amd64.deb \
    && dpkg -i wasi-sdk_8.0_amd64.deb && rm -f wasi-sdk_8.0_amd64.deb \
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
    && echo 'source /emsdk/emsdk_env.sh' >> ~/.profile