# mpdscribble

Assuming you've got mpd in a Docker container, run this:

```
docker run -v $(pwd)/mpdscribble.conf:/etc/mpdscribble.conf --link mpd:mpd --rm mpdscribble
```
