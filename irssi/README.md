# irssi Docker image

Pilfered from Jess Frazelle (@jessfraz) with some minor tweaks.

## Usage

Run on macOS with:

```shell
docker run -it --rm --name irssi -e TERM \
	-u $(id -u):$(id -g) --log-driver=none \
	-v $HOME/.irssi:/home/user/.irssi:rw \
	-v $HOME/Documents/irclogs:/home/user/irclogs:rw \
	irssi
```

Or on Linux with:

```shell
docker run -it --rm --name irssi -e TERM \
	-u $(id -u):$(id -g) --log-driver=none \
	-v $HOME/.irssi:/home/user/.irssi:rw \
	-v $HOME/irclogs:/home/user/irclogs:rw \
	-v /etc/localtime:/etc/localtime:ro \
	irssi
```
