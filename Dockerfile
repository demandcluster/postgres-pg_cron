FROM postgres:latest

RUN apt-get  update --allow-insecure-repositories

RUN apt-get  install -y \
    cron \
    postgresql-cron --allow-insecure-repositories

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/