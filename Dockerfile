FROM alpine:3.15

RUN apk add --no-cache \
      build-base \
      gdb \
      sqlite-dev \
      bzip2-dev \
    && adduser -Dg gpguser gpguser

COPY . /build

RUN cd /build \
    && ./make.sh \
    && ln -s /build/dest/bin/gpg /usr/local/bin/gpg

USER gpguser
