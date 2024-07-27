FROM postgres:latest

RUN apt-get  update --allow-unauthenticated

RUN apt-get  install -y \
    cron \
    postgresql-cron --allow-unauthenticated

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/