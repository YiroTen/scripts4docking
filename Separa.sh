#!/bin/bash

# Nombre de tu archivo
archivo="ClusPro.pdb"

# Primero extrae las lineas y su numero de linea con la palabra END y lo guarda en el archivo line.txt

grep -n END $archivo > line.txt

# Del archivo line.txt extrae solo el numero de linea, lo guarda en el archivo num.txt

grep -Eo '[0-9]{1,10}' line.txt > num.txt

# del archivo num.txt extraela line 1 y lo guarda en una variable L

L=$(awk 'NR==1' num.txt)

# Parte el archivo en dos usando el numero de linea -l de la variable L
# asigna numeros a los archivos de salida con -d 0,1,2...  -a asigna 3 caracteres para los numeros
# en vez de 1 pone 001 etc.

split -l $L -d $archivo out_ --additional-suffix=.pdb #-a 3



