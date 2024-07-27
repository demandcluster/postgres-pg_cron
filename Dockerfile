# Use an official Postgres image as the base
FROM postgres:16


# Copy the install script into the container
COPY setup-pg-cron.sh /usr/local/bin/setup-pg-cron.sh
#COPY init.sql /docker-entrypoint-initdb.d/

# Make sure the script is executable 
RUN chmod +x /usr/local/bin/setup-pg-cron.sh

# Execute the script at container startup
CMD /usr/local/bin/setup-pg-cron.sh