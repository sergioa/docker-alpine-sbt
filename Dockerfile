FROM openjdk:8-jdk-alpine

RUN apk update && \
    apk add --no-cache curl bash

ENV SBT_VERSION 1.1.0
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN curl -sL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

RUN sbt sbtVersion

RUN mkdir /workdir

WORKDIR /workdir

CMD ["/bin/sh"]
