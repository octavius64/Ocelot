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

# This should be a readonly mount of the src/ directory
VOLUME /ocelot_src

# This should be a rw mount where the build will take place
VOLUME /ocelot_build
WORKDIR /ocelot_build

COPY docker/docker-entrypoint.sh /home/
RUN chmod +x /home/docker-entrypoint.sh
CMD ["/home/docker-entrypoint.sh"]
