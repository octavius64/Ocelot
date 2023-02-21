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

RUN mkdir /ocelot
COPY *.cpp *.h CMakeLists.txt /ocelot
COPY CMake /ocelot/CMake
WORKDIR /ocelot

RUN mkdir -p build \
    && cd build \
    && cmake .. \
    && make

COPY docker/docker-entrypoint.sh .
RUN chmod +x ./docker-entrypoint.sh
CMD ./docker-entrypoint.sh
