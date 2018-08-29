# iTunes in Docker via Wine

This Dockerfile and the steps below should successfully build an image containing Wine and a functional 32-bit installation of iTunes.  It works insofar as I can play stuff from my Apple Music account.

It's a bit of a hack job but `¯\_(ツ)_/¯`

## Usage

In order to persist user data, do the following:

```shell
mkdir -p ~/.wine/{iTunes,appdata}
touch ~/.wine/user.reg
```

You'll also need to edit the Dockerfile and amend the UID for the `user` account which is created.

Build the image with something like:

```shell
docker build -t itunes:latest .
```

And then use this shell script to launch:

```shell
#!/usr/bin/env bash
docker run -d --rm --name itunes \
       -e DISPLAY=$DISPLAY \
       -v $HOME/.wine/user.reg:/home/user/.wine/user.reg:rw \
       -v $HOME/.wine/iTunes:/home/user/iTunes:rw \
       -v $HOME/.wine/appdata:/home/user/.wine/drive_c/users/user/Application\ Data:rw \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       --device /dev/snd --group-add audio \
       --cpus "1" \
       itunes:latest \
       wine /home/user/.wine/drive_c/Program\ Files/iTunes/iTunes.exe
```

## Credits
Most of the steps are taken [from here](https://medium.com/@miguel.nunes.72/how-to-install-itunes-on-linux-using-wine-6d5485fb3e85).
 
