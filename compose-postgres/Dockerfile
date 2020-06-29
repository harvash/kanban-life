FROM postgres:12
LABEL maintainer="Harvash <harvash2004@yahoo.com>"

ENV PG_MAJOR 12

RUN apt-get update \
    && apt-get install -y --no-install-recommends && \
    mkdir -p /pgdb/logs && \
    chown -R postgres:postgres /pgdb/logs && \
    chmod 777 /pgdb/logs

   
