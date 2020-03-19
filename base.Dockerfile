from ubuntu:18.04

env DEBIAN_FRONTEND=noninteractive
run apt-get update -qq \
    && apt-get dist-upgrade -qq \
    && apt-get install -qq \
    # Essentials:
    wget curl clang git build-essential software-properties-common cmake automake
