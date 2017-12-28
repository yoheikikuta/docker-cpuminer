FROM ubuntu:16.04
MAINTAINER Yohei Kikuta <diracdiego@gmail.com>

# Install dependencies
run apt-get update && apt-get install -y \
    build-essential \
    autotools-dev \
    automake \
    libcurl4-openssl-dev \
    git

# Clone the cpuminer repository
RUN git clone https://github.com/bitzeny/cpuminer.git
WORKDIR cpuminer

# Build cpuminer
RUN ./autogen.sh && \
    ./configure CFLAGS="-O3 -march=native -funroll-loops -fomit-frame-pointer" && \
    make

# Copy a shell script
COPY ./mining.sh .
RUN chmod +x mining.sh

# Start to mine
ENTRYPOINT ["/cpuminer/mining.sh"]
