#!/bin/bash
# Creo la variable con el directorio que sea va a crear incluída la fecha
############################## SERVIDOR 209 ##################################
POSTGRESQL_209="/media/backup1/srv209/postgres/`date +%d-%b-%Y`"

# Creo el directorio
mkdir -p $POSTGRESQL_209

# Busco todos los ficheros con extesion bz2 y los muevo al directorio creado
find /media/backup1/srv209/postgres/ -maxdepth 1 -name *.tar -exec mv -t $POSTGRESQL_209 {} \;

# Busco los directorios que tengan approx., más de 547 días (año y medio) y los borro
find /media/backup1/srv209/postgres/* -maxdepth 1 -mtime +547 -exec rm -rf {} \;

############################## SERVIDOR 213 ##################################
POSTGRESQL_213="/media/backup1/srv213/postgres/`date +%d-%b-%Y`"

# Creo los directorios
mkdir -p $POSTGRESQL_213

# Busco todos los ficheros con extesion bz2 y los muevo al directorio creado
find /media/backup1/srv213/postgres/ -maxdepth 1 -name *.tar -exec mv -t $POSTGRESQL_213 {} \;

# Busco los directorios que tengan approx., más de 547 días (año y medio) y los borro
find /media/backup1/srv213/postgres/* -maxdepth 1 -mtime +547 -exec rm -rf {} \;
