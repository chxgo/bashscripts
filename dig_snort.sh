#!/bin/bash
# Script para resolver DNS inverso IP bloqueadas
# Escrito por Santiago Lunar
# santiago.lunar.m@gmail.com
# Variables

direcciones="/home/slunar/Downloads/snort_block.pf"
#resultados="/home/slunar/Documents/resultados.txt"
dig="/usr/bin/dig"

echo "Empezando busqueda de IP..."

while read i;
 do
 	echo "####################################"
 	echo "Informacion de IP: $i"
 	echo "####################################"
 	echo ""
 	 	dig -x $i | grep PTR
 	 	dig -x $i | grep SOA
 	 	whois $i | grep NetName
 	 	whois $i | grep OrgName
 	echo ""
 done <$direcciones