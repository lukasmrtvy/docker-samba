FROM alpine:latest

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

ENV SAMBA_VERSION 4.6.8-r0

COPY entrypoint.sh /entrypoint.sh

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} -G ${GROUP} && \
    apk update --no-cache  && apk add --no-cache bash samba=${SAMBA_VERSION} supervisor && \
    mkdir -p /config && \
    chmod +x /entrypoint.sh

EXPOSE 137/udp 138/udp 139 445

COPY smb.conf /config/
COPY supervisord.conf /config/

ENTRYPOINT ["/entrypoint.sh"]

LABEL url=https://api.github.com/repos/samba-team/samba/releases/latest
LABEL version=${SAMBA_VERSION}

CMD /usr/bin/supervisord -c /config/supervisord.conf
