FROM postgres:16.3-bullseye

RUN apt-get  update 

RUN apt-get  install -y \
    cron \
    postgresql-16-cron 

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
