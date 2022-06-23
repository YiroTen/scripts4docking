#! /bin/bash

for f in ligand_*.pdbqt; do
    b=`basename $f .pdbqt`
    echo Processing ligand $b
    mkdir -p $b
    vina --config config.txt --ligand $f --out ${b}/out.pdbqt --log ${b}/log.txt
done

# Este script realiza un cribado con una lista de moléculas pdbqt y
# una proteína usando vina, las moleculas deben estar en la misma
# carpeta, el archivo config.txt y la proteína pdbqt, se crean 
# carpetas con los nombres de los ligandos las moléculas deben tener la palabra ligand_
# si no lo tienen puedes usar el comando mmv para renombrar los ligandos 
# ejecutalo usando el comando "bash script_screening.sh"
