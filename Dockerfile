FROM postgres

RUN apt-get update && apt-get install -y \
        curl \
        ruby

RUN mkdir /adventureworks \
        && cd /adventureworks \
        && curl -L https://github.com/microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks-oltp-install-script.zip > data.zip \
        && curl -L https://github.com/lorint/AdventureWorks-for-Postgres/archive/master.zip > script.zip \
        && unzip data.zip \
        && unzip script.zip \
        && cp AdventureWorks-for-Postgres-master/* . \
        && ruby update_csvs.rb

ENV PGDATA /var/lib/postgresql/adventureworks-data
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"

COPY create-example-db.sh /docker-entrypoint-initdb.d
RUN /docker-entrypoint.sh postgres --version && rm -rf /adventureworks && rm /docker-entrypoint-initdb.d/create-example-db.sh
