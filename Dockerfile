FROM ubuntu:xenial
RUN apt-get update && apt-get install -y wget
RUN nproc
RUN wget http://ipinfo.io/ip -qO -
