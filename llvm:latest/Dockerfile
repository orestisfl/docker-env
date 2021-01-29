from ubuntu:latest

env DEBIAN_FRONTEND=noninteractive
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -qq \
        build-essential \
        gcc-10 \
        g++-10 \
        cmake \
        curl \
        git \
        ninja-build \
        python3 \
        software-properties-common \
        wget

add https://apt.llvm.org/llvm.sh /tmp/llvm.sh
run bash /tmp/llvm.sh 11
env CC=clang
env CXX=clang++
env PATH=/usr/lib/llvm-11/bin:$PATH

# Build LLVM as required by alive2
add https://api.github.com/repos/llvm/llvm-project/git/refs/heads/main /tmp/version.json
run git clone --depth 1 https://github.com/llvm/llvm-project/ \
    && cd llvm-project \
    && mkdir build \
    && cd build \
    && cmake -GNinja -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_EH=ON -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_PROJECTS="llvm;clang" ../llvm \
    && ninja
