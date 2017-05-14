FROM java:alpine

MAINTAINER Jan Cajthaml <jan.cajthaml@gmail.com>

ENV     FLUME_HOME=/flume \
        AGENT=agent \
        CONFIG=flume.conf \
        LOGGER=INFO,console

WORKDIR $FLUME_HOME

RUN     apk add --no-cache bash tar && \
        mkdir -p $FLUME_HOME/plugins.d && \
        wget -qO- http://archive.apache.org/dist/flume/1.7.0/apache-flume-1.7.0-bin.tar.gz \
        | tar zxvf - -C $FLUME_HOME --strip 1 && \
        wget http://central.maven.org/maven2/org/apache/zookeeper/zookeeper/3.3.2/zookeeper-3.3.2.jar -O /flume/lib/zookeeper-3.3.2.jar && \
        wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-core/1.2.1/hadoop-core-1.2.1.jar -O /flume/lib/hadoop-core-0.20.2.jar

CMD     bin/flume-ng agent --conf $FLUME_HOME/conf \
        -f $FLUME_HOME/conf/$CONFIG \
        -n $AGENT \
        -Dflume.root.logger=$LOGGER