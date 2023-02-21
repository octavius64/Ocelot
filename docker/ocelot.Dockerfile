FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        curl \
        default-libmysqlclient-dev \
        libboost-iostreams-dev \
        libboost-system-dev \
        libev-dev \
        libjemalloc-dev \
        libmysql++-dev \
        pkg-config

COPY . /ocelot
WORKDIR /ocelot

RUN mkdir -p build \
    && cd build \
    && cmake .. \
    && make

RUN chmod +x ./docker/docker-entrypoint.sh

CMD ./docker/docker-entrypoint.sh
