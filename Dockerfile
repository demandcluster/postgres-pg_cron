FROM postgres:16

# Install pg_cron

RUN apt-get update && \
    apt-get install -y wget gnupg2 && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y postgresql-16-cron && \
    rm -rf /var/lib/apt/lists/*

# Add the pg_cron configuration to postgresql.conf
RUN echo "shared_preload_libraries = 'pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample

# Copy the script to the docker-entrypoint-initdb.d directory
COPY init.sql /docker-entrypoint-initdb.d/
