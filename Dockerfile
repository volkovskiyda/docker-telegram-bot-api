FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y make git zlib1g-dev libssl-dev gperf cmake clang-18 libc++-18-dev libc++abi-18-dev
WORKDIR /home
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git
RUN mkdir -p /home/telegram-bot-api/build
WORKDIR /home/telegram-bot-api/build
RUN CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-18 CXX=/usr/bin/clang++-18 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install
RUN ls -l /usr/local/bin/telegram-bot-api*
WORKDIR /home

ENTRYPOINT ["telegram-bot-api"]
