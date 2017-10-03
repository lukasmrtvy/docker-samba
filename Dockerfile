FROM alpine:latest

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} -G ${GROUP} && \
    apk update --no-cache && apk upgrade --no-cache && apk add --no-cache bash samba supervisor && \
    mkdir -p /config

EXPOSE 137/udp 138/udp 139 445

ADD smb.conf /config/
ADD supervisord.conf /config/
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

CMD entrypoint.sh
