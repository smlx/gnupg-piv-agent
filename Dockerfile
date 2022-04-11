FROM alpine:3.15

RUN apk add --no-cache \
      build-base \
      gdb \
    && adduser -Dg gpguser gpguser

COPY . /build

RUN cd /build && ./make.sh

USER gpguser
