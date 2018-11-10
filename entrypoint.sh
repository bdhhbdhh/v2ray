mkdir /etc/v2ray
echo -e "$CONFIG" > /etc/v2ray/config.json
v2ray -config=/etc/v2ray/config.json
