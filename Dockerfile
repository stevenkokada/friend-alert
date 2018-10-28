FROM phusion/baseimage:0.11
MAINTAINER Steven Okada "stevenkokada@gmail.com"

ENTRYPOINT [ "/sbin/my_init" ]

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential 
RUN apt-get install -y python3-venv


RUN useradd -ms /bin/bash skokada
COPY . /home/skokada/app
WORKDIR /home/skokada/app
RUN python3 -m venv env 
RUN chown -R skokada:skokada /home/skokada/app 
RUN . env/bin/activate && pip install --upgrade pip && pip install -r requirements.txt && deactivate




