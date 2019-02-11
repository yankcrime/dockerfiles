# Dockerfile for NeoMutt plus 'essentials'
# Largely inspired by Jess Frazelle (@jessfraz)
#
FROM alpine:3.9

RUN apk --no-cache add \
        ca-certificates

ENV HOME /home/user
RUN adduser -u 1000 -D user \
        && mkdir -p $HOME/.mutt \
        && chown -R user:user $HOME

ENV LANG C.UTF-8

ENV NEOMUTT_RELEASE 20180716

RUN set -x \
        && apk add --no-cache --virtual .build-deps \
                autoconf \
                automake \
                coreutils \
		ca-certificates \
                dpkg-dev dpkg \
                gcc \
                g++ \
                glib-dev \
                gnupg \
                libc-dev \
                libxslt-dev \
                libidn-dev \
                libtool \
                links \
                make \
                ncurses-dev \
                openssl \
                openssl-dev \
                gdbm-dev \
                pkgconf \
                tar \
	&& update-ca-certificates \
        && wget "https://github.com/neomutt/neomutt/archive/neomutt-${NEOMUTT_RELEASE}.tar.gz" -P /tmp/ \
        && wget  "https://github.com/neomutt/neomutt/archive/neomutt-${NEOMUTT_RELEASE}.zip" -P /tmp/ \
        && wget  "https://github.com/neomutt/neomutt/releases/download/neomutt-${NEOMUTT_RELEASE}/neomutt-${NEOMUTT_RELEASE}-CHECKSUM" -P /tmp/ \
        && export GNUPGHOME="$(mktemp -d)" \
        && gpg --keyserver ipv4.pool.sks-keyservers.net --recv-keys 86C2397270DD7A561263CA4E5FAF0A6EE7371805 \
        && gpg --batch --verify /tmp/neomutt-${NEOMUTT_RELEASE}-CHECKSUM \
        && cd /tmp/ && sha256sum -c /tmp/neomutt-${NEOMUTT_RELEASE}-CHECKSUM \
        && rm -rf "$GNUPGHOME" /tmp/neomutt-${NEOMUTT_RELEASE}-CHECKSUM \
        && mkdir -p /usr/src/neomutt \
        && tar -xf /tmp/neomutt-${NEOMUTT_RELEASE}.tar.gz -C /usr/src/neomutt --strip-components 1 \
        && rm /tmp/neomutt* \
        && cd /usr/src/neomutt \
        && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        && ./configure \
                --prefix=/usr/local \
                --homespool \
                --gdbm \
                --disable-doc \
                --ssl \
        && make -j "$(nproc)" \
        && make install \
        && rm -rf /usr/src/neomutt \
        && runDeps="$( \
                scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
                        | tr ',' '\n' \
                        | sort -u \
                        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )" \
        && apk add --no-cache --virtual .neomutt-rundeps $runDeps vim msmtp w3m \
        && apk del .build-deps

WORKDIR $HOME

USER user
CMD ["neomutt"]

