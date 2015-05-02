#!/bin/bash
# Docker doesn't have a great way to set runtime environment variables,
# so use this script to prepare the execution environnment for later processes.

export DATABASE_HOST="$DB_PORT_3306_TCP_ADDR"
export DATABASE_PORT="$DB_PORT_3306_TCP_PORT"

exec "$@"
