FROM postgres-16

RUN apt-get  --allow-unauthenticated update && \
    apt-get  --allow-unauthenticated install -y \
    cron \
    postgresql-cron

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/