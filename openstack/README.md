# 'openstack' CLI image

## Usage

Build and then run via the following shell script:

```bash
#!/usr/bin/env bash
docker run -it --rm --name openstack \
       -e OS_CLOUD -u $(id -u):$(id -g) \
       -v $HOME/.config/openstack:/home/user/.config/openstack \
       openstack:latest "$@"
```

