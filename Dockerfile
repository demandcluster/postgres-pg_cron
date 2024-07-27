FROM postgres:16.3-bullseye

RUN apt-get  update 

RUN apt-get  install -y \
    cron \
    postgresql-16-cron 
RUN # Configure logs

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/setup-pg-cron.sh