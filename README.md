Build sbt using Docker
==

The project contains a **Dockerfile** to build the latest, development version of [sbt](http://www.scala-sbt.org/) inside a [Docker](https://www.docker.com/) container.

The aim of the project is to have reproducible builds of sbt without relying on proper *shared* directories like `~/.sbt/0.13` or `~/.ivy2` (that might get stalled after previous builds or similar cases).

## Dependencies

* [jaceklaskowski/docker-sbt-openjdk-6:0.13.8](https://hub.docker.com/r/jaceklaskowski/docker-sbt-openjdk-6/)

## Installation

Latest version:

    $ docker pull jaceklaskowski/docker-builds-sbt:0.13.10

## Run `sbt` REPL

    $ docker run -it --rm jaceklaskowski/docker-builds-sbt:0.13.10 java -jar ~/

## Build the image (on MacOS)

1. `boot2docker up`

        ➜  docker-builds-sbt git:(master) boot2docker up
        Waiting for VM and Docker daemon to start...
        ................ooooooooo
        Started.

        To connect the Docker client to the Docker daemon, please set:
        unset DOCKER_CERT_PATH
        unset DOCKER_TLS_VERIFY
        export DOCKER_HOST=tcp://192.168.59.103:2375

        Or run: `eval "$(boot2docker shellinit)"`

1. `$(boot2docker shellinit)`

        ➜  docker-builds-sbt git:(master) ✗ $(boot2docker shellinit)

1. `docker build -t docker-builds-sbt:0.13.10 .`

        ➜  docker-builds-sbt git:(master) ✗ docker build -t docker-builds-sbt:0.13.10 .
        Sending build context to Docker daemon 75.78 kB
        Sending build context to Docker daemon
        ...
        [success] Total time: 368 s, completed Aug 9, 2015 10:07:21 PM
        -rw-r--r-- 1 root root 1210275 Aug  9 22:02 /root/.ivy2/local/org.scala-sbt/sbt-launch/0.13.10-SNAPSHOT/jars/sbt-launch.jar
         ---> c392e704c2f9
        Removing intermediate container 392cb1a04de0
        Step 9 : CMD java -jar $SBT_JAR_PATH
         ---> Running in fa95476bda2c
         ---> 9bf5b2f07e31
        Removing intermediate container fa95476bda2c
        Successfully built 9bf5b2f07e31

## Working with a container

1. `docker run -it --rm docker-builds-sbt:0.13.10`

## Cleanup (to build the image once more)

1. `docker rm -f $(docker ps -aq)`
1. `docker rmi $(docker images -f "dangling=true" -q)`

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).
