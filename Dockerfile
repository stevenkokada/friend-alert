FROM phusion/baseimage:0.11
MAINTAINER Steven Okada "stevenkokada@gmail.com"

ENTRYPOINT [ "/sbin/my_init" ]

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential 

RUN useradd -ms /bin/bash skokada
COPY . /home/skokada/app
WORKDIR /home/skokada/app
RUN chown -R skokada:skokada /home/skokada/app 
RUN pip3 install -r requirements.txt

# PROD
RUN mkdir /etc/service/pythonserver
COPY pythonserver.sh /etc/service/pythonserver/run
RUN chmod +x /etc/service/pythonserver/run
