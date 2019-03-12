FROM postgres:11

RUN apt-get update && apt-get install -y python3 sudo

RUN mkdir /data

WORKDIR /data




