# DC/OS CLI 

Build with:

```
DOCKER_BUILDKIT=1 docker build -t dcoscli .
```

Then create a shellscript in your `$PATH` called `dcos` with the following contents:

```sh
docker run -it --rm --name dcos -e TERM \
        -v $HOME/.dcos:/home/user/.dcos:rw \
        dcoscli:latest "$@"
```

And then:

```
$ dcos --version
dcoscli.version=0.8.0
```

If you need to access folders from your host, i.e to reference configuration for certain commands, then expand the script to include additional volumes for example:

```shell
docker run -it --rm --name dcos -e TERM \
        -v $HOME/.dcos:/home/user/.dcos:rw \
        -v $HOME/Temp:/home/user/tmp:ro \
        dcoscli:latest "$@"
```

Then reference them in your command like this:

```shell
$ dcos kubernetes cluster create --options=/home/user/tmp/cluster.json
```
