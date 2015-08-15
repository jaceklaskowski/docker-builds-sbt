# sbt on OpenJDK 6
#
# Image to build sbt inside a Docker container as described in https://github.com/sbt/sbt/blob/0.13/CONTRIBUTING.md#build-from-source
#
# URL: https://github.com/jaceklaskowski/docker-builds-sbt
#
# If you're reading this and have any feedback on how this image could be improved,
# please open an issue or a pull request so we can discuss it!

FROM jaceklaskowski/docker-sbt-openjdk-6:0.13.9
MAINTAINER Jacek Laskowski <jacek@japila.pl>

ENV SBT_DEV_VERSION 0.13.10
ENV BUILD_PATH      /tmp
ENV SBT_SOURCES     sbt-sources
ENV SBT_SCRIPT      $BUILD_PATH/sbt
ENV SBT_JAR_PATH    /root/.ivy2/local/org.scala-sbt/sbt-launch/$SBT_DEV_VERSION-SNAPSHOT/jars/sbt-launch.jar
ENV PROJECT_DIR     /scala-project

LABEL description="This image is used to build sbt from the sources" \
      vendor="Japila Software" \
      version="$SBT_DEV_VERSION"

WORKDIR $BUILD_PATH

# Build the development version
RUN git clone git://github.com/sbt/sbt.git $SBT_SOURCES && \
  cd $SBT_SOURCES && \
  $SBT_SCRIPT publishLocal && \
  ls -l $SBT_JAR_PATH && \
  mkdir $PROJECT_DIR && \
  cd $PROJECT_DIR && \
  java -jar $SBT_JAR_PATH about

WORKDIR $PROJECT_DIR

ENTRYPOINT java -jar ${SBT_JAR_PATH}
CMD ["help"]
