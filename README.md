# ContainerizedDevEnv

Making a handy and ready-to-use container image to develop PostgreSQL HEAD for hobby projects.

## How to use

1. Create and connect to the container.

```console
$ git clone https://github.com/TakamichiOsumi/ContainerizedDevEnv.git
$ cd ContainerizedDevEnv
$ docker image build -t dev-pg-image .
$ docker container run --name dev-pg-container --mount type=bind,source="$(pwd)"/host_shared,target=/home/dev/guest_shared -it dev-pg-image bash
```

2. Test the development environment.

```console
# su dev
$ git clone git://git.postgresql.org/git/postgresql.git
$ cd postgresql
$ ./configure --enable-debug --enable-cassert CFLAGS=-O0 --prefix="$PWD/binary"
$ make -j `cat /proc/cpuinfo | grep processor | wc -l` 2> make.log
$ make check-world -j `cat /proc/cpuinfo | grep processor | wc -l` 2> make_check_world.log
```

Note : Executing TAP tests requires perl modules installation. Reconfigure with `--enable-tap-tests` option and reperform the build and tests.
```console
# cpan -v
# cpan install IPC::Run Test::Simple Time::HiRest Test::Harness
```

3. Build the documentation.

```console
$ cd doc/src/sgml
$ make html
```

Exiting from the container, in short, from the development environment, stops the running container.

4. Restart and reconnect to the container.

```console
$ docker container start dev-pg-container
$ docker container attach dev-pg-container
```

5. Clean up.

Make sure the state of the container is exited.

```console
$ docker container rm dev-pg-container
$ docker image rm dev-pg-image
```

## Notes

The directory 'host_shared' in the host directory is the shared directory whose mount point is the '/home/dev/guest_shared' on the container.

The commit id of the cloned PostgreSQL points to the latest HEAD and thus regression tests can fail depending on the timing.
