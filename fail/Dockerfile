# Dockerfile for testing failure
#
FROM alpine:edge
MAINTAINER "nick@dischord.org"

ADD failure.sh /failure.sh
RUN chmod +x /failure.sh

ENTRYPOINT ["/failure.sh"]
