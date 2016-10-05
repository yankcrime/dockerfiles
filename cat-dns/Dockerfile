FROM node:slim
MAINTAINER "nick@dischord.org"

RUN apt-get update && apt-get -y dist-upgrade \
 && apt-get install -y git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && git clone https://github.com/notwaldorf/cat-dns.git /app/cat-dns \
 && cd /app/cat-dns \
 && npm install

EXPOSE 53/udp
CMD node /app/cat-dns/cat-dns.js --address 0.0.0.0

# vim:ts=4:sw=4:et:ft=Dockerfile
