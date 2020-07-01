FROM debian:buster
env DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y \
    curl tmux vim wget zip git openssh-client \
    build-essential m4 cpp gcc make libtool automake autoconf libgmp-dev openjdk-11-jdk \
    # For tests / demo
    xterm xvfb

RUN wget https://www.verificatum.org/files/verificatum-vmn-3.0.4-full.tar.gz \
    && tar xvfz verificatum-vmn-3.0.4-full.tar.gz \
    && rm -f *.gz \
    && cd verificatum-vmn-3.0.4-full \
    && for filename in *.gz; do tar xzf "$filename"; done \
    && rm -f *.gz \
    && cd /verificatum-vmn-3.0.4-full/verificatum-vcr-3.0.4 \
    && ./configure && make install \
    && vog -rndinit RandomDevice /dev/urandom \
    && cd ../verificatum-vmn-3.0.4 \
    && ./configure && make install
