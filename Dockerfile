# FROM redis:latest
FROM redis:alpine
MAINTAINER knutole@mapic.io

ADD ./mapic-entrypoint.sh /tmp/mapic-entrypoint.sh
CMD sh /tmp/mapic-entrypoint.sh