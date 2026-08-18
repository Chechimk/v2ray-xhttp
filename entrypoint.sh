#!/bin/sh
# substitute Cloud Run's dynamic PORT into the config before starting
sed -i "s/\"port\": 8080/\"port\": ${PORT:-8080}/" /app/config.json
exec /app/xray run -c /app/config.json
