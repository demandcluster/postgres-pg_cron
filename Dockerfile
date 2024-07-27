# Use an official Postgres image as the base
FROM postgres:16


# Copy the install script into the container
COPY setup_pg_cron.sh /usr/local/bin/setup_pg_cron.sh

# Make sure the script is executable
RUN chmod +x /usr/local/bin/setup_pg_cron.sh

# Execute the script at container startup
CMD /usr/local/bin/setup_pg_cron.sh