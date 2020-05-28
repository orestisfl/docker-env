from ubuntu:18.04

env DEBIAN_FRONTEND=noninteractive
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -qq \
    wget curl git build-essential software-properties-common cmake automake ninja-build python

run git clone --depth 1 https://github.com/Z3Prover/z3 \
    && cd z3 \
    && mkdir build && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr -GNinja ../ \
    && ninja install

run git clone --depth=1 https://github.com/llvm/llvm-project/ \
    && cd llvm-project \
    && mkdir build && cd build \
    && cmake -GNinja ../llvm \
        -DLLVM_ENABLE_RTTI=On \
        -DLLVM_ENABLE_EH=On \
        -DBUILD_SHARED_LIBS=On \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_ENABLE_ASSERTIONS=On \
        -DLLVM_FORCE_ENABLE_STATS=On \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_Z3_SOLVER=On \
        -DLLVM_ENABLE_PROJECTS='llvm;clang;compiler-rt' \
    && ninja install
