#!/bin/bash
# Creo la variable con el directorio que sea va a crear incluída la fecha
############################## SERVIDOR 209 ##################################
MYSQL_209="/media/backup1/srv209/mysql/`date +%d-%b-%Y`";

# Creo los directorios
mkdir -p $MYSQL_209;

# Busco todos los ficheros con extesion bz2 y los muevo al directorio creado
find /media/backup1/srv209/mysql/ -maxdepth 1 -name *bz2 -exec mv -t $MYSQL_209 {} \;

# Busco los directorios que tengan approx., más de 547 días (año y medio) y los borro
find /media/backup1/srv209/mysql/* -maxdepth 1 -mtime +547 -exec rm {} \;

############################## SERVIDOR 213 ##################################
MYSQL_213="/media/backup1/srv213/mysql/`date +%d-%b-%Y`";

# Creo los directorios
mkdir -p $MYSQL_213;

# Busco todos los ficheros con extesion bz2 y los muevo al directorio creado
find /media/backup1/srv213/mysql/ -maxdepth 1 -name *bz2 -exec mv -t $MYSQL_213 {} \;

# Busco los directorios que tengan approx., más de 547 días (año y medio) y los borro
find /media/backup1/srv213/mysql/* -maxdepth 1 -mtime +547 -exec rm {} \;
