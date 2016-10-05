# cat-dns Docker Image

This Docker image makes it relatively trivial to run [cat-dns](https://github.com/notwaldorf/cat-dns).  All that kitty goodness wrapped up in a container.

## Running on macOS

As an example, if you want to switch up Google's homepage (and everything under `.google.com`, basically) for images of cats then do this:

```bash
echo 'nameserver 127.0.0.1\nport 10053' | sudo tee /etc/resolver/google.com
```

Now run up a container using this image:

```bash
docker run -d -p 10053:53/udp --name cat-dns yankcrime/cat-dns
```

And browse to [http://google.com](http://google.com):

![catdns](https://dl.dropboxusercontent.com/u/174303/catdns.png)

🐳 + 🐈 = ❤️

## Running on anything else

I'll just assume you know what you're doing.

