from ubuntu:18.04

env DEBIAN_FRONTEND=noninteractive
run apt-get update -qq \
    && apt-get full-upgrade -qq \
    && apt-get install -qq \
    curl git software-properties-common unzip wget zip \
    automake build-essential cmake ninja-build

# Install llvm 10.x
# See https://apt.llvm.org/
add https://apt.llvm.org/llvm-snapshot.gpg.key llvm.key
run apt-key add llvm.key \
    && echo 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main' >> /etc/apt/sources.list \
    # && echo 'deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main' >> /etc/apt/sources.list \
    && apt-get update -qq \
    && apt-get install -qq clang-10 lldb-10 lld-10 llvm-10 llvm-10-dev llvm-10-runtime z3 libz3-dev

env PATH="/usr/lib/llvm-10/bin:$PATH"
