FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y make git zlib1g-dev libssl-dev gperf cmake g++
WORKDIR /home
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git
RUN mkdir -p /home/telegram-bot-api/build
WORKDIR /home/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install
RUN ls -l /usr/local/bin/telegram-bot-api*
WORKDIR /home

ENTRYPOINT ["telegram-bot-api"]
