FROM alpine:3.14

RUN apk add --no-cache \
      build-base \
      gdb \
      ncurses-dev \
      pinentry \
      py3-pygments \
      && wget -P ~ https://git.io/.gdbinit

COPY . /app

RUN cd /app && ./make.sh

# RUN /app/dest/bin/gpg --quick-gen-key --passphrase '' --pinentry-mode loopback foo@example.com nistp256
RUN /app/dest/bin/gpg --quick-gen-key --passphrase '' --pinentry-mode loopback foo@example.com rsa \
      && echo bar > /tmp/bar \
      && /app/dest/bin/gpg gpg -er foo@example.com /tmp/bar
