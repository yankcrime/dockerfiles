# OpenStack CLI container image
FROM alpine:3.12

LABEL maintainer="nick@dischord.org"

RUN apk --no-cache add \
        ca-certificates

ENV HOME /home/user
RUN adduser -u 1001 -D user \
    && mkdir -p $HOME \
    && chown -R user:user $HOME

ENV LANG C.UTF-8

RUN set -x \
    && apk add --no-cache --update \
    python3 \
    python3-dev \
    ca-certificates \
    build-base \
    libffi-dev \
    openssl-dev \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade --no-cache-dir \
    pip setuptools \
    python-openstackclient \
    python-novaclient \
    python-neutronclient \
    python-magnumclient \
    python-octaviaclient

WORKDIR $HOME

USER user
ENTRYPOINT ["openstack"] 
