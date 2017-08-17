#!/bin/bash

# get redis conf from env
MAPIC_REDIS_AUTH=${MAPIC_REDIS_AUTH:-noauth}
MAPIC_REDIS_DAEMONIZE=${MAPIC_REDIS_DAEMONIZE:-no}
MAPIC_REDIS_PORT=${MAPIC_REDIS_PORT:-6379}
MAPIC_REDIS_TIMEOUT=${MAPIC_REDIS_TIMEOUT:-0}
MAPIC_REDIS_LOGLEVEL=${MAPIC_REDIS_LOGLEVEL:-notice}
MAPIC_REDIS_DIR=${MAPIC_REDIS_DIR:-/data}
MAPIC_REDIS_APPENDONLY=${MAPIC_REDIS_APPENDONLY:-yes}
MAPIC_REDIS_APPENDFSYNC=${MAPIC_REDIS_APPENDFSYNC:-everysec}

# create redis.conf file
cd /tmp && touch redis.conf
echo "daemonize no" >> redis.conf
echo "port 6379" >> redis.conf
echo "timeout 0" >> redis.conf
echo "tcp-keepalive 0" >> redis.conf
echo "loglevel notice" >> redis.conf
echo "databases 16" >> redis.conf
echo "dbfilename redis.rdb" >> redis.conf
echo "dir /data" >> redis.conf
echo "maxmemory 23592960000" >> redis.conf
echo "appendonly yes" >> redis.conf
echo "appendfsync everysec" >> redis.conf
echo "requirepass $MAPIC_REDIS_AUTH" >> redis.conf

redis-server redis.conf