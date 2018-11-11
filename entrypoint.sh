#!/bin/bash
if [ -z $CONFIG ]; then
  echo -e "$CONFIG" > /etc/v2ray/config.json
fi
v2ray -config=/etc/v2ray/config.json
