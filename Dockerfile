FROM alpine:latest AS builder
RUN apk add --no-cache build-base

WORKDIR /src
COPY hello.c .

RUN gcc -static -o hello hello.c

FROM scratch
COPY --from=builder /src/hello /hello
COPY os-release /usr/lib/os-release
COPY hello-world-oci.service /usr/lib/systemd/system/hello-world-oci.service
ENTRYPOINT ["/hello"]
