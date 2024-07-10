# dockerfiles

Making a handy and ready-to-use container image to develop PostgreSQL for hobby projects.

## How to use

Create and connect to the container of the development environment.

```console
$ git clone https://github.com/TakamichiOsumi/dockerfiles.git
$ cd dockerfiles
$ docker build -t dev-pg-image .
$ docker container run --name dev-pg-container --mount type=bind,source="$(pwd)"/host_shared,target=/workspace/guest_shared -it dev-pg-image bash
```

Exiting the container stops the running container. To reconnect to the container, run the below commands.
```console
$ docker container start dev-pg-container
$ docker container attach dev-pg-container
```

## Notes

The directory 'host_shared' in the host directory is the shared directory whose mount point is the '/workspace/guest_shared' on the container.
