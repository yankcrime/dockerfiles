FROM fedora:31
MAINTAINER "nick@dischord.org"

ENV HOME /home/user
RUN adduser -u 1000 user \
        && mkdir -p $HOME/.dcos \
        && chown -R user:user $HOME

RUN curl https://downloads.dcos.io/binaries/cli/linux/x86-64/0.8.0/dcos -o /dcos \
    && chmod +x /dcos

USER user
ENTRYPOINT ["/dcos"]
