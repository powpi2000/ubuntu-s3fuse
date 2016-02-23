FROM ubuntu:14.04
MAINTAINER eric <powpi2000@gmail.com>


RUN apt-get update -y
RUN apt-get install build-essential git libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool -y
RUN apt-get install pkg-config libssl-dev -y
WORKDIR /tmp
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse
WORKDIR /tmp/s3fs-fuse/

RUN ./autogen.sh
RUN ./configure --prefix=/usr --with-openssl
RUN make
RUN make install

