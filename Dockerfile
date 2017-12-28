FROM ubuntu:16.04
MAINTAINER Yohei Kikuta <diracdiego@gmail.com>

run apt-get update && apt-get install -y \
    build-essential \
    autotools-dev \
    automake \
    libcurl4-openssl-dev \
    git

RUN git clone https://github.com/bitzeny/cpuminer.git
WORKDIR cpuminer

RUN ./autogen.sh && \
    ./configure CFLAGS="-O3 -march=native -funroll-loops -fomit-frame-pointer" && \
    make

ENTRYPOINT ["/bin/bash"]
