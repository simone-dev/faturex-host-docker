FROM postgis/postgis:14-3.3

ADD postgresql.conf /etc/postgresql/postgres.conf

# COPY init_db.sh /home/init_db.sh
#COPY init_db.sh /docker-entrypoint-initdb.d/

EXPOSE 5432

#RUN sed -i -e 's/\r$//' /home/init_db.sh

#RUN /bin/bash '/home/init_db.sh'
