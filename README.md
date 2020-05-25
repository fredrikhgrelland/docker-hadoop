![Docker](https://github.com/fredrikhgrelland/docker-hadoop/workflows/Docker/badge.svg)
# docker-hadoop
Docker build for hadoop based on openjdk:8-alpine. Used as base-image for [fredrikhgrelland/docker-hive](https://github.com/fredrikhgrelland/docker-hadoop)

This image is expected to be used as a base image for hive etc. and works with object storage. This image has not been tested as data and name-node.

This image can be built and operated behind a corporate proxy where the base os needs to trust a custom CA. [See this](./ca_certificates/README.md)

See [fredrikhgrelland/docker-hive](https://github.com/fredrikhgrelland/docker-hadoop) for an example.


Credits:
Influenced by [BDE](https://github.com/big-data-europe/docker-hadoop)
