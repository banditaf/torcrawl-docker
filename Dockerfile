FROM ubuntu:20.04

RUN apt-get update && apt-get dist-upgrade -y && apt-get install git python3 python3-pip tor -y && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/james04gr/TorCrawl.py /torcrawl && \
    cd /torcrawl && \
    pip3 install -r requirements.txt && \
    ln -s /usr/local/lib/python3.8/dist-packages/usr/lib/libyara.so /usr/lib/libyara.so && \
    mkdir /results

WORKDIR /torcrawl

CMD service tor start && while true; do sleep 3; done
