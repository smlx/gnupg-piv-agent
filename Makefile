.PHONY: run-release
run-release:
	docker run --rm -it --user=$$(id -u) -v $$HOME/.gnupg:/home/gpguser/.gnupg -v /run/user/1000/gnupg/S.gpg-agent:/home/gpguser/.gnupg/S.gpg-agent ghcr.io/smlx/gnupg-piv-agent:latest

.PHONY: run
run: build
	docker run --rm -it --user=$$(id -u) -v $$HOME/.gnupg:/home/gpguser/.gnupg -v /run/user/1000/gnupg/S.gpg-agent:/home/gpguser/.gnupg/S.gpg-agent gnupg-piv-agent sh

.PHONY: build
build:
	docker build . -t gnupg-piv-agent
