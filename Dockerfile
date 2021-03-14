FROM alpine:3.13

RUN apk add --no-cache \
      build-base \
      ncurses-dev \
      pinentry

COPY . /app

RUN ls /app

RUN cd /app && ./make.sh

# RUN /app/dest/bin/gpg --quick-gen-key --passphrase '' --pinentry-mode loopback foo@example.com nistp256
