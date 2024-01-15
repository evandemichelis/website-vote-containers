service postgresql start
psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
psql -c "ALTER USER postgres WITH SUPERUSER;"
psql