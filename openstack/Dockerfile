# OpenStack CLI container image
FROM alpine:3.10

LABEL maintainer="nick@dischord.org"

RUN apk --no-cache add \
        ca-certificates

ENV HOME /home/user
RUN adduser -u 1001 -D user \
        && mkdir -p $HOME \
        && chown -R user:user $HOME

ENV LANG C.UTF-8

RUN set -x \
    && apk add --update \
       python \
       python-dev \
       py-pip \
       ca-certificates \
       build-base \
       libffi-dev \
       openssl-dev \
    && pip install \
       python-openstackclient \
       python-novaclient \
       python-neutronclient \
       python-magnumclient \
       python-octaviaclient

WORKDIR $HOME

USER user
ENTRYPOINT ["openstack"] 
