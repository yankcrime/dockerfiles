# MultiMarkdown in Docker
This is a super compact Docker image containing an installation of [MultiMarkdown](http://fletcherpenney.net/multimarkdown/).  Once built, you can pass stuff to it like:

```
docker build -t mmd .

[..]

cat README.md | docker run --rm --name multimarkdown -i mmd
```

By default you'll get XHTML output from your Markdown file.  For other outputs, just pass the same options as you'd expect to the `multimarkdown` command itself, e.g:

```
cat README.md | docker run --rm --name multimarkdown -i mmd -t odf
```

For convenience's sake, I'd recommend wrapping it up with the following shell script:

```bash
$ cat ~/bin/multimarkdown
#!/usr/bin/env bash
docker run --rm --name multimarkdown -i mmd "$@"
```
