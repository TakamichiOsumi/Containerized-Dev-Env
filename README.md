# ContainerizedDevEnv

Making a handy and ready-to-use container image to develop PostgreSQL for hobby projects.

## How to use

1. Create and connect to the container.

```console
$ git clone https://github.com/TakamichiOsumi/ContainerizedDevEnv.git
$ cd ContainerizedDevEnv
$ docker image build -t dev-pg-image .
$ docker container run --name dev-pg-container --mount type=bind,source="$(pwd)"/host_shared,target=/workspace/guest_shared -it dev-pg-image bash
```

Exiting the container stops the running container.

2. Reconnect to the container after restarting the env.

```console
$ docker container start dev-pg-container
$ docker container attach dev-pg-container
```

3. Clean up.

Make sure the state of the container is exited.

```console
$ docker container rm dev-pg-container
$ docker image rm dev-pg-image
```

## Notes

The directory 'host_shared' in the host directory is the shared directory whose mount point is the '/workspace/guest_shared' on the container.
