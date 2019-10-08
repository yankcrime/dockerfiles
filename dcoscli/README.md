# DC/OS CLI 

Build with:

`DOCKER_BUILDKIT=1 docker build -t dcoscli .`

Then create a shellscript in your `$PATH` called `dcos` with the following contents:

```sh
docker run -it --rm --name dcos -e TERM \
        -v $HOME/.dcos:/home/user/.dcos:rw \
        dcoscli:latest "$@"
```

And then:

```
$ dcos --version`
dcoscli.version=1.0.1
```
