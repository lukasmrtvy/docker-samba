# docker-samba

## Info:
Based on Alpine:latest

## Usage:
`docker rm -f samba ; docker run -d -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445 -v /mnt/myext:/mnt/ext -e SMBUSER_PWD=test --name samba lukasmrtvy/docker-samba`
