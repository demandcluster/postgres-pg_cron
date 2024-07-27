FROM postgres:latest

RUN apt-get  --allow-insecure-repositories && \
    apt-get  --allow-insecure-repositories -y \
    cron \
    postgresql-cron

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/