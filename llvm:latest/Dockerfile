from ubuntu:latest

env DEBIAN_FRONTEND=noninteractive
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -qq \
    git build-essential cmake ninja-build python3

# Build LLVM as required by alive2
add https://api.github.com/repos/llvm/llvm-project/git/refs/heads/master /tmp/version.json
run git clone --depth 1 https://github.com/llvm/llvm-project/ \
    && cd llvm-project \
    && mkdir build \
    && cd build \
    && cmake -GNinja -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_EH=ON -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_PROJECTS="llvm;clang" -DCMAKE_INSTALL_PREFIX=/usr/local ../llvm \
    && ninja install
