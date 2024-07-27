# Use an official Postgres image as the base
FROM postgres:16

# Set the working directory to /docker-entrypoint-initdb.d/
WORKDIR /docker-entrypoint-initdb.d/

# Copy the setup script and SQL file into the working directory
COPY setup-pg-cron.sh .
COPY init.sql .

# Install pg_cron
RUN git clone https://github.com/citusdata/pg_cron.git && \
    cd pg_cron && \
    export PATH=/usr/pgsql-16/bin:$PATH && \
    make && \
    sudo PATH=$PATH make install

# Clean up the pg_cron repository
RUN rm -rf pg_cron