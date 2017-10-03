# docker-samba


docker rm -f samba ; docker run -d -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445 -v /mnt/ext:/mnt/ext -e PWD=password --name samba samba
