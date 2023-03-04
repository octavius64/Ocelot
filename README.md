# Ocelot

Ocelot is a BitTorrent tracker written in C++ for the [Gazelle](http://whatcd.github.io/Gazelle/) project. It supports requests over TCP and can only track IPv4 peers.

This forked version is used as a submodule by the Octavius Gazelle repo:
https://github.com/octavius64/Gazelle

It is built and deployed using Docker. Refer to that Gazelle repo for instructions.

### Run-time options (Configured in the Dockerfile)

* `-c <path/to/ocelot.conf>` - Path to config file. If unspecified, the current working directory is used.
* `-v` - Print queue status every time a flush is initiated.

### Signals (Unused by the Docker workflow)

* `SIGHUP` - Reload config
* `SIGUSR1` - Reload torrent list, user list and client whitelist
