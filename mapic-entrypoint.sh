#!/bin/bash

echo "mapic-entrypoint.sh -->>>"

# get redis conf from env
MAPIC_REDIS_AUTH=${MAPIC_REDIS_AUTH:-noauth}
MAPIC_REDIS_DAEMONIZE=${MAPIC_REDIS_DAEMONIZE:-no}
MAPIC_REDIS_PORT=${MAPIC_REDIS_PORT:-6379}
MAPIC_REDIS_TIMEOUT=${MAPIC_REDIS_TIMEOUT:-0}
MAPIC_REDIS_LOGLEVEL=${MAPIC_REDIS_LOGLEVEL:-notice}
MAPIC_REDIS_DIR=${MAPIC_REDIS_DIR:-/data}
MAPIC_REDIS_APPENDONLY=${MAPIC_REDIS_APPENDONLY:-yes}
MAPIC_REDIS_APPENDFSYNC=${MAPIC_REDIS_APPENDFSYNC:-everysec}

echo "MAPIC_REDIS_AUTH $MAPIC_REDIS_AUTH"
echo "MAPIC_REDIS_DAEMONIZE $MAPIC_REDIS_DAEMONIZE"
echo "MAPIC_REDIS_PORT $MAPIC_REDIS_PORT"
echo "MAPIC_REDIS_TIMEOUT $MAPIC_REDIS_TIMEOUT"
echo "MAPIC_REDIS_LOGLEVEL $MAPIC_REDIS_LOGLEVEL"
echo "MAPIC_REDIS_DIR $MAPIC_REDIS_DIR"
echo "MAPIC_REDIS_APPENDONLY $MAPIC_REDIS_APPENDONLY"
echo "MAPIC_REDIS_APPENDFSYNC $MAPIC_REDIS_APPENDFSYNC"

# create redis.conf file
cd /tmp && touch redis.conf
echo "daemonize $MAPIC_REDIS_DAEMONIZE" >> redis.conf
echo "port $MAPIC_REDIS_PORT" >> redis.conf
echo "timeout 0" >> redis.conf
# echo "tcp-keepalive 0" >> redis.conf
echo "tcp-keepalive 300" >> redis.conf
echo "loglevel $MAPIC_REDIS_LOGLEVEL" >> redis.conf
# echo "loglevel verbose" >> redis.conf
echo "databases 16" >> redis.conf
echo "dbfilename redis.rdb" >> redis.conf
echo "dir $MAPIC_REDIS_DIR" >> redis.conf
echo "maxmemory 23592960000" >> redis.conf
echo "appendonly $MAPIC_REDIS_APPENDONLY" >> redis.conf
echo "appendfsync $MAPIC_REDIS_APPENDFSYNC" >> redis.conf
echo "requirepass $MAPIC_REDIS_AUTH" >> redis.conf
echo "always-show-logo yes" >> redis.conf

# display config for debug
ls -la redis.conf
cat redis.conf

# start redis
redis-server redis.conf
