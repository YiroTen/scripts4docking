#!/bin/bash
#SBATCH -J VinalcPrueba			# job name
#SBATCH -o VinalcPrueba.o%j			# output and error file name (%j expands to jobID)
#SBATCH -N 1				# number of MPI tasks (cores) requested
#SBATCH --ntasks-per-node=12		# task (cores) per node (maximum 24)
#SBATCH -p comp				# SLURM queue (partition)
#SBATCH -t 10:00:00			# run time (hh:mm:ss)

# Load your modules here
module load tools/mpich/3.1-5
module load applications/vinalc/1.3

# Run your task here
mpirun -np $SLURM_NTASKS vinalc --recList recList.txt --ligList ligList.txt --geoList geoList.txt --exhaustiveness 8 --num_modes 1

# el archivo de ligandos debe decir ./data/ligands1.pdbqt debe llevar el punto antes forzozamente
# los archivos de ligandos pueden contener varios ligandos pero deben llevar MODEL y ENDMDL
# sbatch script.sh para correrlo
# squeue -u 202101045c para ver el status del job
# gunzip -d file.gz para descomprimir el file
