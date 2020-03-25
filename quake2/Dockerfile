FROM ubuntu:18.04
MAINTAINER "nick@dischord.org"

ENV HOME /opt/quake2

RUN useradd -m -u 1000 quake2 \
	&& mkdir -p /opt/quake2/baseq2 \
        && chown -R quake2:quake2 $HOME \
	&& apt update && apt install -y wget \
	&& wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O - | tar zxvf - -C /opt/quake2

USER quake2
WORKDIR $HOME
EXPOSE 27910

CMD ./q2proded +exec server.cfg +set dedicated 1 +set deathmatch 1
