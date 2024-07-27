#!/bin/bash

cat <<EOT >> /var/lib/postgresql/data/postgresql.conf
shared_preload_libraries='pg_cron'
cron.database_name='postgres'
EOT

# Update package lists
apt-get update

# Install pg_cron
apt-get install -y pg-cron
