```shell
#!/usr/bin/env bash
docker run -it --rm --name weechat -e TERM \
        -u $(id -u):$(id -g) --log-driver=none \
        -v $HOME/.weechat:/home/user/.weechat:rw \
        -v $HOME/irclogs:/home/user/irclogs:rw \
        -v /etc/localtime:/etc/localtime:ro \
        weechat
```
