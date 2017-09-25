#!/bin/bash

# Credenciales de motoro
user="movistar"
password="Mt47Sdx;0"
host="localhost"
db_name="yrangel_encmovis_02092016"

# Opciones
fecha=`date "+%Y-%m-%d"`
hora=`date "+%H:%M"`
root_path="/var/backups/mysql"
where="fecha=$fecha"

# Adicionales
mkdir -p $root_path/$fecha/$hora
backup_path=$root_path/$fecha/$hora

# Lista de tablas
tables="contactos_atencion_digital contacto_callcenter contactos_derivaciones_call contactos_derivaciones_cds contactos_factura contactos_ivr contactos_mi_movistar contactos_servicio_integral contactos_servtec contatcto_televentas"

# Creo el bucle que me lee la lista de tablas y les hace el dump
for tb in $tables; do
	echo "Respaldando información del $fecha de la tabla $tb de la base de datos $db_name en $backup_path con el nombre $tb.sql"
#	mysqldump --user=$user --password=$password --host=$host $db_name $tb --where=$where > $backup_path/$tb.sql
done