#!/bin/bash
# Escrito por Santiago Lunar
# santiago.lunar.m@gmail.com
# ------------------------------------------------------------------------------------#
# Script para restaurar la base de datos del motor MySQL del proyecto MOVISTAR

# Credenciales de motor
user="root"
password="123456"
host="localhost"
email="santiago.lunar.m@gmail.com"

# Opciones adicionales
mysql=/usr/bin/mysql
fecha=`date "+%Y%m%d"`
backup_path=/media/respaldos/srv213/mysql
fecha_restore=`date "+%Y%m%d" --date="2 days ago"`
fecha_drop=`date "+%Y%m%d" --date="7 days ago"`

# Obtengo una lista completa de las bases de datos del motor
#databases=$(echo "SHOW DATABASES" | $mysql --user=$user --password=$password --host=$host)
#databases="yrangel_restore_20161016 prueba_encmovis novartis_des encmovis_cert"
database=yrangel_encmovis_20161007
cd $backup_path/$fecha_restore
echo "Copiando respaldo comprimido desde $backup_path/$fecha_restore a /var/backups/mysql/"
cp yrangel_encmovis_20161007.sql.bz2 /var/backups/mysql/
cd /var/backups/mysql/
echo "Estamos en /var/backups/mysql/"
echo "Descomprimiendo base de datos yrangel_encmovis_20161007"
echo "Esta operación puede tardar varios minutos"
if bzip2 -d yrangel_encmovis_20161007.sql.bz2 
	then
		echo "La descompresion fue exitosa"
		echo "..."
		echo "Se procede a borrado/creación de bases de datos"
		echo "Borrando base de datos yrangel_encmovis_restore_$fecha_restore"
		if mysqladmin drop -f yrangel_encmovis_restore_$fecha_drop -u $user -p$password -h $host
			then
				echo "Se borró exitosamente el restore anterior"
				echo "Se procede a crear la nueva base de datos para el restore"
				echo "Creando nueva base datos yrangel_encmovis_restore_$fecha"
				if mysqladmin create yrangel_encmovis_restore_$fecha -u $user -p$password -h $host
					then
					echo "Se creó exitosamente la nueva base de datos"
					echo "Se hará el restore en la base de datos yrangel_encmovis_restore_$fecha"
					echo "Ésta operación tardará 15 minutos aproximadamente"
					if mysql -u root -p$password yrangel_encmovis_restore_$fecha < yrangel_encmovis_20161007.sql
						then
							echo "Se ha restaurado exitosamente la base de datos"
							echo "Se borra el archivo de restauracion"
							rm -f /var/backups/mysql/yrangel_encmovis_20161007.sql
							echo "Finalizado con éxito"
						else
							echo "ERROR: No se pudo restaurar la base de datos"
						fi
					else
						echo "ERROR: No se pudo crear la nueva base de datos"
					fi
				else
					echo "ERROR: No se ha podido borra el restore anterior"
			fi
	else
		echo "ERROR: No se pudo descomprimir"
		echo "Terminado"
		exit 0
fi