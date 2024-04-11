FROM python:3.10.8-slim-buster

RUN apt update && apt upgrade -y \
    && apt install git dos2unix -y

COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

RUN mkdir /VJ-FILTER-BOT
WORKDIR /VJ-FILTER-BOT
COPY start.sh /start.sh

RUN dos2unix /start.sh
CMD ["/bin/bash", "/start.sh"]
