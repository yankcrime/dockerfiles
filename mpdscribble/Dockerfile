FROM debian:12
MAINTAINER "nick@dischord.org"

ENV HOME /home/user
RUN adduser -u 1000 user \
        && mkdir -p $HOME/.dcos \
        && chown -R user:user $HOME

RUN apt update && apt-get dist-upgrade -y && apt install -y mpdscribble

USER user
ENTRYPOINT ["mpdscribble", "-D", "--log", "/dev/stdout"]
