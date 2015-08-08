# Build sbt using Docker

The project contains a **Dockerfile** to build the latest, development version of sbt inside a Docker container.

The aim is to have reproducible builds of sbt without relying on proper *shared* directories like `~/.sbt/0.13` or `~/.ivy2`.

## Build the image (on MacOS)

1. `boot2docker up`
1. `$(boot2docker shellinit)`
1. `docker build -t sbt-build:0.1 .`

## Working with a container

1. `docker run -it --rm --name sbt-build sbt-build:0.1`
1. `docker exec -it sbt-build`
1. `docker stop sbt-build`

## Cleanup (to build the image once more)

1. `docker rm -f $(docker ps -aq)`
1. `docker rmi $(docker images -f "dangling=true" -q)`

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.


## License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
