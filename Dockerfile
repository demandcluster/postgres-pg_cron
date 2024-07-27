FROM postgres


COPY setup-pg-cron.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/

RUN git clone https://github.com/citusdata/pg_cron.git
RUN cd pg_cron
# Ensure pg_config is in your path, e.g.
RUN export PATH=/usr/pgsql-16/bin:$PATH
RUN make && sudo PATH=$PATH make install
