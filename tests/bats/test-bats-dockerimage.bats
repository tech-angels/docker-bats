#!/usr/bin/env bats

@test "With no cmd/args, the image return Bats version" {
  run bash -c 'docker run -it --rm tech-angels/bats:${VERSION} | grep "Bats" | grep "Bats 0.4.0"'
  [ "$status" -eq 0 ]
}

@test "A sample bats test" {
  # Following Docker docs., hostname is the ID of the current running container by default
  # Since we run bats inside Docker, we have to share a known path to abstract from underlying host
  docker run -t --volumes-from $(hostname) techangels/bats:${VERSION} /app/tests/samples/
}
