#!/bin/bash

pdbedit  -L -u ${USER}

if [[  $? -ne 0 ]]; then
  echo -e "${PWD}\n${PWD}" | smbpasswd -a -s -c /config/smb.conf ${USER}
fi

exec /usr/bin/supervisord -c /config/supervisord.conf
