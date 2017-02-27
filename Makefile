.PHONY: build test all

VERSION=0.4.0

all: build test

build:
	docker build --tag techangels/bats:${VERSION} .

test:
	docker run \
		-t --rm \
		-v $(PWD):/app \
		-v /var/run/docker.sock:/docker.sock \
		-e DOCKER_HOST="unix:///docker.sock" \
		-e VERSION=${VERSION} \
		techangels/bats:${VERSION} \
		/app/tests/bats/
