#!/bin/bash
set -eo pipefail

cd build

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

echo Starting ocelot...
exec ./ocelot -v -c ocelot.cnf
