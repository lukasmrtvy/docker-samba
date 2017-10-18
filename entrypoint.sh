#!/bin/sh

if [ ! -d /mnt/ext ]; then
  echo "Volume must be mounted to /mnt/ext"
  exit 1
fi

if [ -n "${SMBUSER_PWD+x}" ]; then
  pdbedit  -L -u ${USER}
  if [[  $? -ne 0 ]]; then
    echo "Creating password for ${USER}"
    echo -e "${SMBUSER_PWD}\n${SMBUSER_PWD}" | smbpasswd -a -s -c /config/smb.conf ${USER}
  fi
else
  echo "Env variable SMBUSER_PWD is not supplied"
  exit 1
fi

exec "$@"
