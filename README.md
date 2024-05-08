# NPIO

Nginx&PHP in One

## Build

```bash
docker build -t npio .
```

## Run

Starting a NPIO instance is simple:

```bash
docker run -d --restart always \
  --name npio \
  -p 80:80 \
  -p 9000:9000 \
  -v $(pwd)/html:/var/www/html \
  npio
```

## via [`docker-compose`](https://github.com/docker/compose)

```yaml
version: '3'
services:
  npio:
    restart: always
    image: npio
    container_name: 'npio'
    ports:
      - 8080:80
      - 9000:9000
    volumes:
      - ./html:/var/www/html
```



## References

- [Docker Hub - pondhia/npio](https://hub.docker.com/r/pondhia/npio)