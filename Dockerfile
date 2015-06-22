FROM ubuntu:14.04

# build packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -yq build-essential cmake

# copy local checkout into /opt
ADD . /opt

WORKDIR /opt

# configure
RUN mkdir build && cd build && cmake ..

WORKDIR /opt/build

# build and cleanup in a single layer
RUN make 
