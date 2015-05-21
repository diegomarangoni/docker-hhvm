FROM debian:jessie

MAINTAINER "Diego Marangoni" <diegomarangoni@me.com>

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list

RUN apt-get update && \
    apt-get install -y hhvm && \
    rm -rf /var/lib/apt/lists/*

CMD ["hhvm", "-a"]
