# Image to build sbt inside a Docker container
# https://github.com/sbt/sbt/blob/0.13/CONTRIBUTING.md#build-from-source

FROM java:6
MAINTAINER Jacek Laskowski <jacek@japila.pl>

LABEL Description="This image is used to build sbt from the sources" Vendor="Japila Software" Version="1.0"

ENV SBT_VERSION 0.13.8
ENV BUILD_PATH /tmp
ENV SBT_SCRIPT $BUILD_PATH/sbt.sh

RUN curl -Lo $BUILD_PATH/sbt-launch.jar https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar

ADD sbt $SBT_SCRIPT
RUN chmod +x $SBT_SCRIPT

# Downloads all the necessary dependencies
RUN $SBT_SCRIPT about

WORKDIR $BUILD_PATH

RUN git clone git://github.com/sbt/sbt.git sbt-sources

WORKDIR sbt-sources

RUN $SBT_SCRIPT publishLocal

CMD ["/bin/bash"]
