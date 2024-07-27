FROM postgres:latest

RUN apt-get  update --allow-insecure-repositories && \
    apt-get  install -y \
    cron \
    postgresql-cron

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/