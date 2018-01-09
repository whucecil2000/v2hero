cd /v2raybin
echo -e -n '{"log":{"loglevel":"warning"},"inbound":{"protocol":"vmess","port":' > config.json
echo -e -n '8088' >> config.json
echo -e -n ',"settings":{"clients":[{"id":"' >> config.json
echo -e -n '9e53c877-af25-47ed-9549-118ed80996d1' >> config.json
echo -e -n '","alterId":64,"security":"none"}]},"streamSettings":{"network":"ws"}},"inboundDetour":[],"outbound":{"protocol":"freedom","settings":{}}}' >> config.json
if [ "$CERT_PEM" != "$KEY_PEM" ]; then
echo -e "$CERT_PEM" > cert.pem
echo -e "$KEY_PEM"  > key.pem
fi
./v2ray
