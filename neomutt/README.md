# NeoMutt Docker image

Mostly pilfered (again) from Jess Frazelle (@jessfraz).

## Usage

Run on macOS with:

```shell
docker run -it --rm --name mutt -e TERM \
	-v $HOME/.mutt:/home/user/.mutt:rw \
	-v $HOME/.vimrc:/home/user/.vimrc:ro \
	-v $HOME/.vim:/home/user/.vim:ro \
	-v $HOME/.msmtprc:/home/user/.msmtprc:ro \
	neomutt
```

And on Linux with:

```shell
docker run -it --rm --name mutt -e TERM \
	-v $HOME/.mutt:/home/user/.mutt:rw \
	-v $HOME/.vimrc:/home/user/.vimrc:ro \
	-v $HOME/.msmtprc:/home/user/.msmtprc:ro \
        -v /etc/localtime:/etc/localtime:ro \
	neomutt
```

Linux needs the `/etc/localtime` mapping, and in my case I don't have a fancy
Vim configuration on my Linux modes so the additional volume mapping my
`~/.vim` isn't required.  YMMV.
