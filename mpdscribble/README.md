# mpdscribble

Assuming you've got mpd in a Docker container, run this:

```
docker run -v $(pwd)/mpdscribble.conf:/etc/mpdscribble.conf --link mpd:mpd --rm mpdscribble
```

How do I run mpd in Docker you ask? Easy:

```
docker run --name mpd -p 6600:6600 \
    -v /run/user/1000/pipewire-0:/tmp/pipewire-0 \
    -e XDG_RUNTIME_DIR=/tmp --cap-add=sys_nice \
    -v $(pwd)/tmp/mpd.conf:/etc/mpd.conf \
    -v /syn/audio:/var/lib/mpd/music \
    tobi312/rpi-mpd:alpine
```
