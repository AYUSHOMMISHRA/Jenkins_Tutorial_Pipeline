FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV name ayushommishra

RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD index.html /var/www/html

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
