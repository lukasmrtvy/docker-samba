# docker-samba


docker rm -f samba ; docker run -d -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445 --name samba samba
