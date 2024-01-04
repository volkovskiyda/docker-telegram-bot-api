FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake
WORKDIR /home
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git
RUN mkdir -p /home/telegram-bot-api/build
WORKDIR /home/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install
RUN ls -l /usr/local/bin/telegram-bot-api*
WORKDIR /home

ENTRYPOINT ["telegram-bot-api"]
