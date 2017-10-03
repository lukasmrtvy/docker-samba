FROM alpine:latest

RUN  apk update --no-cache && apk upgrade --no-cache && apk add --no-cache bash samba supervisor

EXPOSE 137/udp 138/udp 139 445

ADD smb.conf /tmp/
ADD supervisord.conf /tmp/

CMD  /usr/bin/supervisord -c /tmp/supervisord.conf
