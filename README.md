# `hello-world-oci`

## Quick Start
```
sudo importctl pull-oci --class portable ghcr.io/gdamjan/hello-world-oci
sudo portablectl list
sudo portablectl inspect hello-world-oci
sudo portablectl attach --now hello-world-oci
```

## Build and run with Podman (or Docker)

Same image works with Podman/Docker:

```
$ podman build -t hello-world .
$ podman run -it --rm hello-world
Hello, World!
```
or
```
$ podman run -it --rm ghcr.io/gdamjan/hello-world-oci:latest
Hello, World!
```
