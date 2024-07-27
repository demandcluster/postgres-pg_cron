FROM postgres


# Add Docker's official GPG key:

RUN apt-get  install -y \
    cron \
    postgresql-cron 

COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/