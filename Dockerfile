FROM postgres:16.3-bullseye

RUN apt-get  update 

RUN apt-get  install -y \
    cron \
    postgresql-16-cron 
RUN # Configure logs

RUN echo "shared_preload_libraries = 'pg_cron'" >> /var/lib/postgresql/data/postgres.conf
RUN echo "cron.database_name = 'postgres'" >> /var/lib/postgresql/data/postgres.conf
