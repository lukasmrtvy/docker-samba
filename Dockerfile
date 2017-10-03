FROM alpine:latest 

RUN apk update --no-cache && apk upgrade --no-cache && apk add --no-cache bash samba

EXPOSE 137/udp 138/udp 139 445

CMD smbd -F -S && nmbd -F -S 
