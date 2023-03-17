FROM octavius64/ocelot_base:v1

# This should be a readonly mount of the src/ directory
VOLUME /ocelot_src

# This should be a rw mount where the build will take place
VOLUME /ocelot_build
WORKDIR /ocelot_build

COPY docker/docker-entrypoint.sh /home/
RUN chmod +x /home/docker-entrypoint.sh
CMD ["/home/docker-entrypoint.sh"]
