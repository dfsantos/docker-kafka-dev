FROM alpine:3.12.0

MAINTAINER Diego dos Santos <santos.diegoferreira@gmail.com>: 

###################
# Linux base tools
###################
RUN apk update && apk add --no-cache \
        bash \
        curl \
        openjdk8-jre-base \
        tzdata \
        tar

###################
# Kafka
###################
RUN curl -o /opt/kafka-download.tgz http://ftp.unicamp.br/pub/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz && \
    cd /opt && \
    mkdir kafka && \
    tar -xzf kafka-download.tgz -C kafka --strip-components 1 && \
    rm /opt/kafka-download.tgz

EXPOSE 2181 9092
