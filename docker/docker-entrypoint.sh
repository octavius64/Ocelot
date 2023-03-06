#!/bin/bash
set -eo pipefail

echo Generating ocelot.cnf...

echo > ocelot.cnf
echo mysql_host = $MYSQL_HOST >> ocelot.cnf
echo mysql_db = $MYSQL_DATABASE >> ocelot.cnf
echo mysql_username = $MYSQL_USER >> ocelot.cnf
echo mysql_password = $MYSQL_PASSWORD >> ocelot.cnf
echo site_host = $GAZELLE_HOST >> ocelot.cnf
echo site_password = $GAZELLE_SITE_PASSWORD >> ocelot.cnf
echo report_password = $GAZELLE_REPORT_PASSWORD >> ocelot.cnf
echo listen_port = $OCELOT_LISTEN_PORT >> ocelot.cnf

echo Building Ocelot...
cmake /ocelot_src
make
# Create a copy so that we can run builds while Ocelot is running
cp ocelot ocelot.live

bash /home/wait_db_ready.sh

echo Starting ocelot...
exec ./ocelot.live -c ocelot.cnf

# NOTE IF YOU'RE ACTIVELY DEVELOPING IN DOCKER:
# Uncomment the following 2 lines and comment out the above exec line
# ============================================

# while true; do sleep 3600; done
# ./ocelot.live -c ocelot.cnf
