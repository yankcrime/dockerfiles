# Dockerfile for MultiMarkdown
#
FROM alpine:edge
MAINTAINER "nick@dischord.org"

ENV LANG C.UTF-8
ENV MULTIMARKDOWN_RELEASE 6.4.0

RUN set -x && \
    apk add --no-cache --virtual .build-deps \
	autoconf \
	automake \
	coreutils \
	curl \
	curl-dev \
	libcurl \
	cmake \
	git \
	gcc \
	g++ \
	make \
	musl-dev \
&& wget "https://github.com/fletcher/MultiMarkdown-6/archive/${MULTIMARKDOWN_RELEASE}.tar.gz" -P /tmp \
&& cd /tmp && tar xf ${MULTIMARKDOWN_RELEASE}.tar.gz \
&& cd MultiMarkdown-6-${MULTIMARKDOWN_RELEASE} && make release && make \
&& cd build && make && make install && rm -rf /tmp/*.tar.gz && rm -rf /tmp/Multi* \
&& runDeps="$( \
    scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
	| tr ',' '\n' \
	| sort -u \
	| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
)" \
&& apk add --no-cache --virtual .multimarkdown-rundeps $runDeps \
&& apk del .build-deps

ENTRYPOINT ["multimarkdown"]

