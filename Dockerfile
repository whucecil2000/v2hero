FROM alpine:latest

#ENV CONFIG_JSON1=none CONFIG_JSON2=none UUID=91cb66ba-a373-43a0-8169-33d4eeaeb857 CONFIG_JSON3=none CERT_PEM=none KEY_PEM=none VER=3.5
ENV CONFIG_JSON1={"log":{"loglevel":"warning"},"inbound":{"protocol":"vmess","port":
ENV CONFIG_JSON2=,"settings":{"clients":[{"id":"
ENV CONFIG_JSON3=","alterId":64,"security":"none"}]},"streamSettings":{"network":"ws"}},"inboundDetour":[],"outbound":{"protocol":"freedom","settings":{}}}
ENV UUID=9e53c877-af25-47ed-9549-118ed80996d1
ENV CERT_PEM=none KEY_PEM=none VER=3.5
ENV PORT=80

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2raybin \ 
 && cd /v2raybin \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && mv /v2raybin/v2ray-v$VER-linux-64/v2ray /v2raybin/ \
 && mv /v2raybin/v2ray-v$VER-linux-64/v2ctl /v2raybin/ \
 && mv /v2raybin/v2ray-v$VER-linux-64/geoip.dat /v2raybin/ \
 && mv /v2raybin/v2ray-v$VER-linux-64/geosite.dat /v2raybin/ \
 && chmod +x /v2raybin/v2ray \
 && rm -rf v2ray.zip \
 && rm -rf v2ray-v$VER-linux-64 \
 && chgrp -R 0 /v2raybin \
 && chmod -R g+rwX /v2raybin 
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

#ENTRYPOINT /entrypoint.sh

CMD /entrypoint.sh



