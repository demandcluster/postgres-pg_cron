FROM postgres:latest

# Install pg_cron
RUN apt-get update  \
    apt-get install -y postgresql-16-cron  \
    rm -rf /var/lib/apt/lists/*

# Add the pg_cron configuration to postgresql.conf
RUN echo "shared_preload_libraries = 'pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample

# Ensure the configuration is copied to the actual configuration file location
RUN echo "shared_preload_libraries = 'pg_cron'" >> /var/lib/postgresql/data/postgresql.conf

# Copy the script to the docker-entrypoint-initdb.d directory
COPY init.sql /docker-entrypoint-initdb.d/
