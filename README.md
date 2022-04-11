# GnuPG patched for piv-agent

This repository builds a Docker image with a build of `gnupg` containing a very simple patch/hack to work around `gnupg` [bug T5555](https://dev.gnupg.org/T5555).

This means you can use this Docker image to add ECDSA signing subkeys to your existing GPG key for use with [`piv-agent`](https://github.com/smlx/piv-agent).

## Usage

Simply running `make` will pull down the latest release of the image from this repository, mount your `~/.gnupg` and `piv-agent` sockets into the container, and start a shell.
From that shell you can run `gpg` commands to add an ECDSA signing subkey as per the `piv-agent` documentation [here](https://smlx.github.io/piv-agent/docs/gpg-walkthrough/#add-signing-subkey).

## Building the image locally

`make run` will `docker build` the image locally and run it.
