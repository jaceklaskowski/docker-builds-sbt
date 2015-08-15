Build sbt using Docker
==========

[![DockerPulls](https://img.shields.io/docker/pulls/jaceklaskowski/docker-builds-sbt.svg)](https://hub.docker.com/r/jaceklaskowski/docker-builds-sbt/)
[![DockerStars](https://img.shields.io/docker/stars/jaceklaskowski/docker-builds-sbt.svg)](https://hub.docker.com/r/jaceklaskowski/docker-builds-sbt/)

This image contains the latest, development version of [sbt](http://www.scala-sbt.org/) aka **sbt 0.13.10-SNAPSHOT**. For more information on sbt, see [the official sbt site](http://www.scala-sbt.org/).

You can use the image to work with your Scala projects using the "latest" version of sbt (without anything to install but Docker alone).

Please note that since the image can obviously be a couple of days lagging after the development of sbt. [The repository the image comes from](https://github.com/jaceklaskowski/docker-builds-sbt) contains the **Dockerfile** to build the version of sbt from the day you run the build.

The aim of the project is showcase how to have reproducible builds of sbt without relying on proper *shared* directories like `~/.sbt/0.13` or `~/.ivy2` (that might get stalled after previous builds or similar cases).

Once built, the image can serve as a testing development environment before switching to the version of sbt in your projects. Work with the latest sbt in your projects using the image until you're ready to do the permanent switch for the entire team.

## Usage

The following `docker run` command executes `sbt` in the current directory on the host, but **inside** a Docker container. Any changes of the files or directories in the shared directory in the container are already available on the local machine.

    $ docker run -it --rm -v $(pwd):/scala-project jaceklaskowski/docker-builds-sbt

where `$(pwd)` resolves to your current working directory with the Scala/sbt project of yours.

    ➜  docker-builds-sbt git:(master) ✗ docker run -it --rm -v $(pwd):/scala-project docker-builds-sbt
    [info] Set current project to scala-project (in build file:/scala-project/)
    > about
    [info] This is sbt 0.13.10-SNAPSHOT
    [info] The current project is {file:/scala-project/}scala-project 0.1-SNAPSHOT
    [info] The current project is built against Scala 2.10.5
    [info] Available Plugins: sbt.plugins.IvyPlugin, sbt.plugins.JvmPlugin, sbt.plugins.CorePlugin, sbt.plugins.JUnitXmlReportPlugin
    [info] sbt, sbt plugins, and build definitions are using Scala 2.10.5

## Building the image (with the very latest sources of sbt)

Execute `docker build` command to build the image on your own Docker host. Since a part of the build process is to pull the sbt sources from the repository, the image is as fresh as it could ever be.

    $ docker build -t docker-builds-sbt:latest .

Execute the command every change in sbt's `0.13` branch.

## Contribution policy

Contributions via [GitHub pull requests](https://github.com/jaceklaskowski/docker-builds-sbt/pulls) are gladly accepted from their original author.

Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).
