FROM postgres:latest

RUN apt-get install debian-ports-archive-keyring
RUN gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys B4C86482705A2CE1
RUN apt-key update

RUN apt-get  update 

RUN apt-get  install -y \
    cron \
    postgresql-cron 

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/