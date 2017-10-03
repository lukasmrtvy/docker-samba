FROM alpine:latest

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

ENV SAMBA_VERSION 4.6.4-r1

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} -G ${GROUP} && \
    apk update --no-cache && apk upgrade --no-cache && apk add --no-cache bash samba=${SAMBA_VERSION} supervisor && \
    mkdir -p /config

EXPOSE 137/udp 138/udp 139 445

ADD smb.conf /config/
ADD supervisord.conf /config/
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

LABEL url=https://api.github.com/repos/samba-team/samba/releases/latest
LABEL name=samba
LABEL version=${SAMBA_VERSION}

CMD /usr/bin/supervisord -c /config/supervisord.conf
