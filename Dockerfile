FROM alpine:3.13

RUN apk add --no-cache \
      build-base \
      ncurses-dev \
      pinentry

COPY . /app

RUN ls /app

RUN cd /app && ./make.sh
