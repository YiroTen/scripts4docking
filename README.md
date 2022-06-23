# scripts
Hello This is a small script to perform automated docking using Autodock some conditions must be acomplished befor you use it first all your ligands must have the word ligand at the begining for example "ligand_one.pdbqt" and they must be minimized in energy, the config file config.txt wich contains the box and cordinates that comes from vina must be in the same directory, as well as this script and the pdbqt ligands, this script will make one directory for each docking (protein + ligand), inside each directory you will find the result of the docking "out.pdbqt" and the log file "log.txt"


Scripts para proceso de datos de docking y acoplamiento molecular. <br>
Esta serie de scripts sirven para procesar los datos de Docking <br>
empleando AutoDock y AutoDockVina, así como Vina LC la version de Vina para cluster https://plsuser.llnl.gov/bbs/vinalc/

#! /bin/bash

for f in ligand_*.pdbqt; do
    b=`basename $f .pdbqt`
    echo Processing ligand $b
    mkdir -p $b
    vina --config config.txt --ligand $f --out ${b}/out.pdbqt --log ${b}/log.txt
done
