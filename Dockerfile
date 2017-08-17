FROM redis:latest
MAINTAINER knutole@mapic.io

ADD ./mapic-entrypoint.sh /tmp/mapic-entrypoint.sh
CMD bash /tmp/mapic-entrypoint.sh