# Dockerfile for NeoMutt plus 'essentials'
# Largely inspired by Jess Frazelle (@jessfraz)
#
FROM alpine:3.18

RUN apk --no-cache add \
        ca-certificates

ENV HOME /home/user
RUN adduser -u 1000 -D user \
        && mkdir -p $HOME/.mutt \
        && chown -R user:user $HOME

ENV LANG C.UTF-8

ENV NEOMUTT_RELEASE 20230517

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
                libidn2-dev \
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
        && wget "https://github.com/neomutt/neomutt/archive/${NEOMUTT_RELEASE}.tar.gz" -P /tmp/ \
        && wget  "https://github.com/neomutt/neomutt/archive/${NEOMUTT_RELEASE}.zip" -P /tmp/ \
        && wget  "https://github.com/neomutt/neomutt/releases/download/${NEOMUTT_RELEASE}/${NEOMUTT_RELEASE}-CHECKSUM" -P /tmp/ \
        && export GNUPGHOME="$(mktemp -d)" \
	&& for key in 86C2397270DD7A561263CA4E5FAF0A6EE7371805 ; do \
	  gpg --keyserver keys.openpgp.org --recv-keys "$key" ; \
	done \
        && gpg --batch --verify /tmp/${NEOMUTT_RELEASE}-CHECKSUM \
        && cd /tmp/ && sha256sum -c /tmp/${NEOMUTT_RELEASE}-CHECKSUM \
        && rm -rf "$GNUPGHOME" /tmp/${NEOMUTT_RELEASE}-CHECKSUM \
        && mkdir -p /usr/src/neomutt \
        && tar -xf /tmp/${NEOMUTT_RELEASE}.tar.gz -C /usr/src/neomutt --strip-components 1 \
        && rm /tmp/${NEOMUTT_RELASE}* \
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
        && apk add --no-cache --virtual .neomutt-rundeps $runDeps msmtp neovim ncurses poppler-utils vim w3m \
        && apk del .build-deps

WORKDIR $HOME

USER user
CMD ["neomutt"]

