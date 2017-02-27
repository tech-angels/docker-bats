# Bats Docker image

This repository is used to create a Docker image embedding [bats](https://github.com/sstephenson/bats), a bash-testing framework.

## Usage

Run the docker image, with your tests mounted inside the container:

```
$ docker run \
	v $(PWD):/app \
	techangels/bats \
		/app/my-tests
```

### Using docker inside the container:

The image container a docker client, so you can even run docker tests inside the container:

```
docker run -t -v $PWD:/app -v /var/run/docker.sock:/docker.sock -e DOCKER_HOST="unix:///docker.sock" --rm techangels/bats /app/tests
```

```bash
#!/usr/bin/env bats

@test "With no cmd/args, the image return Bats version" {
  run bash -c 'docker run -it --rm techangels/bats:${VERSION} | grep "Bats" | grep "Bats 0.4.0"'
    [ "$status" -eq 0  ]

}
```
