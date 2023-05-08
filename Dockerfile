FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y git build-essential g++ zlib1g-dev gperf cmake libssl-dev

WORKDIR /home
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git
RUN mkdir -p /home/telegram-bot-api/build
WORKDIR /home/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build . --target install
RUN ls -l /usr/local/bin/telegram-bot-api*
WORKDIR /home

ENTRYPOINT ["telegram-bot-api"]

LABEL maintainer="Volkovskyi Dmytro"
