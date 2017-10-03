#!/bin/bash

if [[ -n ${PWD} ]];then
  pdbedit  -L -u ${USER}
  if [[  $? -ne 0 ]]; then
    echo -e "${PWD}\n${PWD}" | smbpasswd -a -s -c /config/smb.conf ${USER}
  fi
else
  echo "env variable PWD is not supplied"
  exit 1
fi

exec /usr/bin/supervisord -c /config/supervisord.conf
