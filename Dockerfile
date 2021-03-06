FROM ubuntu:latest as builder

RUN apt-get update
RUN apt-get install curl -y
RUN curl -L -o /tmp/go.sh https://install.direct/go.sh
RUN chmod +x /tmp/go.sh
RUN /tmp/go.sh

FROM alpine:latest

COPY --from=builder /usr/bin/v2ray/v2ray /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/v2ctl /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/geoip.dat /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/geosite.dat /usr/bin/v2ray/

ADD entrypoint.sh /
ADD config.json /etc/v2ray/

RUN set -ex && \
    apk --no-cache add ca-certificates && \
    mkdir /var/log/v2ray/ && \
    chmod -R g+rwX /etc/v2ray && \ 
    chmod -R g+rwX /var/log/v2ray && \ 
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray && \
    chmod +x /entrypoint.sh

ENV CONFIG=""    
ENV PATH /usr/bin/v2ray:$PATH

EXPOSE 443
EXPOSE 8080

CMD /entrypoint.sh
