# Docker Container for Satisfactory Dedicated Server

This is a slightly adjusted version from the official [wiki](https://satisfactory.fandom.com/wiki/Dedicated_servers#Linux).

# How to run it

Best way is to use a composer file like this:

```yml
version: '3.8'

services:
  satisfactory-ds-docker:
    image: devidian/satisfactory-dedicated:latest
    container_name: satisfactory-ds-docker
    restart: unless-stopped
    volumes:
      # left side: your docker-host machine
      # right side: the paths in the image (!!do not change!!)
      - /appdata/satisfactoy/dedicated:/home/steam/Satisfactory-dedicated
    ports:
      - target: 15777
        published: 15777
        protocol: udp
        mode: host
      - target: 15000
        published: 15000
        protocol: udp
        mode: host
      - target: 7777
        published: 7777
        protocol: udp
        mode: host
```

and run `docker-compose up -d`.