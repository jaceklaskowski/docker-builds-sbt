Build sbt using Docker
==========

[![DockerPulls](https://img.shields.io/docker/pulls/jaceklaskowski/docker-builds-sbt.svg)](https://hub.docker.com/r/jaceklaskowski/docker-builds-sbt/)
[![DockerStars](https://img.shields.io/docker/stars/jaceklaskowski/docker-builds-sbt.svg)](https://hub.docker.com/r/jaceklaskowski/docker-builds-sbt/)

The project contains a **Dockerfile** to build the latest, development version of [sbt](http://www.scala-sbt.org/) inside a [Docker](https://www.docker.com/) container. You can then use the image to work with your Scala projects using the version of sbt (without polluting your local development environment).

The aim of the project is to have reproducible builds of sbt without relying on proper *shared* directories like `~/.sbt/0.13` or `~/.ivy2` (that might get stalled after previous builds or similar cases).

Once built, the image can serve as a testing development environment before switching to the version of sbt in your projects. Work with the latest sbt in your projects using the image until you're ready to do the permanent switch for the entire team.

## Dependencies

* [jaceklaskowski/docker-sbt-openjdk-6:0.13.8](https://hub.docker.com/r/jaceklaskowski/docker-sbt-openjdk-6/)

## Installation (aka Pulling image from Docker Hub)

    $ docker pull jaceklaskowski/docker-builds-sbt:0.13.10

## Runing `sbt` REPL with your project

    $ docker run -v $(pwd):/tmp/scala-project -it --rm jaceklaskowski/docker-builds-sbt:0.13.10

where `$(pwd)` resolves to your current working directory with the Scala/sbt project of yours.

## Building the image

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

## Cleanup (to build the image once more)

1. `docker rm -f $(docker ps -aq)`
1. `docker rmi $(docker images -f "dangling=true" -q)`

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).
