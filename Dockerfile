FROM alpine:latest AS builder
RUN apk add --no-cache build-base

WORKDIR /src
COPY hello.c .

RUN gcc -static -o hello hello.c

# scratch has no shell, so prepare the empty mount points (dirs and files) here
RUN <<EOF
  mkdir -p /rootfs/proc /rootfs/sys /rootfs/dev /rootfs/run /rootfs/tmp /rootfs/var/tmp
  chmod 1777 /rootfs/tmp /rootfs/var/tmp
  mkdir -p /rootfs/etc && touch /rootfs/etc/resolv.conf /rootfs/etc/machine-id
EOF

FROM scratch
COPY --from=builder /rootfs/ /
COPY os-release /usr/lib/os-release
COPY hello-world-oci.service /usr/lib/systemd/system/hello-world-oci.service

COPY --from=builder /src/hello /hello
ENTRYPOINT ["/hello"]
