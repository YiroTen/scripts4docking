This are a series of scripts to semi-automate the docking process using Autodock Vina, you should take in to account that some prerequisites must be completed 
before you could use this script, your protein must be clean, your ligands must be energy-minimized. Moreover the name of your ligands must have the
structure "ligand_one.pdbqt", all of them must be inside the same directory, as well as the "config.txt" file from Vina, the script "script_screening.sh", 
and the protein file "protein.pdbqt".

The Script will generate one directory for each docking, so you will have many directories as ligands, inside each directory you will have the output from docking
and a log file, in the output file you will have the ligands (num_modes) that you programed in vina inside the config file. If you programed in the config file 3 or the 
first 10 best positions for each docking, that will be in the "out.pdbqt", also you will find the log file inside each directory.

your config.txt file should look like this, you should remove the "ligand" and "out" line that originale came and 
you should add the exhaustiveness and number of modes lines, in this example an exhaustivenes of 8 and only the first (best mode)
is going to be at the out.pdbqt file

This script is thinked to be used in Ubuntu enviroment

------------example of config.txt file--------------------

# receptor = 5JMT.pdbqt
# center_x = -24.788
# center_y = 17.865
# center_z = -21.964
# size_x = 20.0
# size_y = 22.0
# size_z = 20.0
# exhaustiveness = 8
# num_modes = 1

------------------------------------------------------------

