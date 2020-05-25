![Docker](https://github.com/fredrikhgrelland/docker-hadoop/workflows/Docker/badge.svg)
# docker-hadoop
Docker build for hadoop based on adoptopenjdk:8-jdk-hotspot. Used as base-image for [fredrikhgrelland/docker-hive](https://github.com/fredrikhgrelland/docker-hadoop)

This image is expected to be used as a base image for hive etc. and works with object storage. This image has not been tested as data and name-node.

This image can be built and operated behind a corporate proxy where the base os needs to trust a custom CA. [See this](./ca_certificates/README.md)
While building locally using the Makefile, you may set the environment variable CUSTOM_CA to a file or directory in order to import them.

## Published images
[dockerhub](https://hub.docker.com/r/fredrikhgrelland/hadoop)
[github](https://github.com/fredrikhgrelland/docker-hadoop/packages)

## Build locally for development
`make build`

If behind a corporate proxy with custom CA:
`CUSTOM_CA=/usr/local/share/ca-certificates make`

## Examples
See [fredrikhgrelland/docker-hive](https://github.com/fredrikhgrelland/docker-hadoop) for example usage.

Credits:
Influenced by [BDE](https://github.com/big-data-europe/docker-hadoop)
