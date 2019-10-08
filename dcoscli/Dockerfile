FROM alpine:3.9
MAINTAINER "nick@dischord.org"

RUN apk --no-cache add \
        ca-certificates

ENV HOME /home/user
RUN adduser -u 1000 -D user \
        && mkdir -p $HOME/.dcos \
        && chown -R user:user $HOME

RUN wget -O /dcos https://downloads.dcos.io/cli/releases/binaries/dcos/linux/x86-64/latest/dcos \
    && chmod +x /dcos

USER user
ENTRYPOINT ["/dcos"]
