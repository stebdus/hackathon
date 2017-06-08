#!/bin/sh
# Run as root and cd into misc dir before running!

# Build webapp image
cd ../webapp
docker build -t webapp .

# Copies opt to /opt to pre-configure grafana dashboards.
cd ../misc
cp -r ./opt/* /opt/
mkdir /opt/elasticsearch/conf/scripts

echo "Run docker using"
echo "Interatively: docker-compose up"
echo "Daemon: docker-compose up -d"
