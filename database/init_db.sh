#!/bin/sh

su -l postgres -c /usr/local/pgsql/bin/initdb
su -l postgres -c "/usr/local/pgsql/bin/pg_ctl -D /var/lib/postgresql/14/data -l /tmp/pg_logfile start"

psql "postgres://postgres:root@localhost/postgres?sslmode=disable" <<-EOSQL
create database "matti_db";
create user "matti_user" with encrypted password 'matti_password';
grant all privileges on database "matti_db" to "matti_user";
alter database "matti_db" owner to "matti_user";
EOSQL

psql "postgres://matti_user:matti_password@$localhost/matti_db?sslmode=disable" <<-EOSQL
create schema "matti_principal";
ALTER DEFAULT PRIVILEGES IN SCHEMA matti_principal GRANT ALL ON TABLES TO matti_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA matti_principal GRANT ALL ON SEQUENCES TO matti_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA matti_principal GRANT EXECUTE ON FUNCTIONS TO matti_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA matti_principal GRANT USAGE ON TYPES TO matti_user WITH GRANT OPTION;
EOSQL

psql "postgres://postgres:root@localhost/postgres?sslmode=disable" <<-EOSQL
create database "faturex_db";
create user "faturex_user" with encrypted password 'faturex_password';
grant all privileges on database "faturex_db" to "faturex_user";
alter database "faturex_db" owner to "faturex_user";
EOSQL

psql "postgres://faturex_user:faturex_password@$localhost/faturex_db?sslmode=disable" <<-EOSQL
create schema "faturex_principal";
ALTER DEFAULT PRIVILEGES IN SCHEMA faturex_principal GRANT ALL ON TABLES TO faturex_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA faturex_principal GRANT ALL ON SEQUENCES TO faturex_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA faturex_principal GRANT EXECUTE ON FUNCTIONS TO faturex_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA faturex_principal GRANT USAGE ON TYPES TO faturexuser WITH GRANT OPTION;
EOSQL