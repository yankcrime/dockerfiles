FROM alpine:edge

RUN apk add --no-cache \
	ca-certificates \
	python \
	py2-pip \
	weechat \
	weechat-perl \
	weechat-python

RUN pip install websocket-client

ENV HOME /home/user

RUN adduser -S user -h $HOME \
	&& chown -R user $HOME

WORKDIR $HOME
USER user

ENTRYPOINT [ "weechat" ]
