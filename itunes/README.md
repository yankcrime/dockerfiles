# iTunes in Docker via Wine

This Dockerfile should successfully build an image containing Wine and a functional 32-bit installation of iTunes.

## Usage
The shell script I'm using to launch an instance of iTunes is:

```shell
#!/usr/bin/env bash
docker run -it --rm --name itunes \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       --device /dev/snd --group-add audio \
       itunes:latest \
       wine /home/user/.wine/drive_c/Program\ Files/iTunes/iTunes.exe 
```

## Credits
Most of the steps are taken [from here](https://medium.com/@miguel.nunes.72/how-to-install-itunes-on-linux-using-wine-6d5485fb3e85).
 
