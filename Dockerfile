FROM redis:latest
MAINTAINER knutole@mapic.io

ADD ./docker-entrypoint.sh /tmp
CMD [ "bash /tmp/docker-entrypoint.sh"]