FROM ubuntu:16.04

#MongoDB
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*
# Define mountable directories.
VOLUME ["/data/db"]
# Define working directory.
WORKDIR /data
# Define default command.
CMD ["mongod"]
# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

#Python3&Scrapy
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y nano 
RUN apt-get install -y vim
RUN apt-get -y dist-upgrade
RUN apt-get install -y openssh-server
RUN apt-get install -y python3.5 python3-pip
RUN apt-get install -y zlib1g-dev libffi-dev libssl-dev
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN mkdir /code
WORKDIR /code
ADD ./requirements.txt /code/
ADD ./settings.py /code/
RUN mkdir /code/spider
RUN pip3 install -r requirements.txt
VOLUME [ "/data" ]

RUN \ 
  apt-get clean && \
  apt-get autoclean && \
  apt-get autoremove
