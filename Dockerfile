FROM postgres:16.3-bullseye

RUN apt-get  update 

RUN apt-get  install -y \
    cron \
    postgresql-16-cron 
RUN # Configure logs

ENV POSTGRES_SHARED_PRELOAD_LIBRARIES=pg_cron
ENV POSTGRES_CRON_DATABASE_NAME=postgres