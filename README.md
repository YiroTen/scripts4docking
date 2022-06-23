The first script is to automate many dockings vs the same protein
The second one is to perform docking of one protein vs one ligan many times 100-1000 as much as you want some times to check or obtain statistics
The third one is to permorm dockings in a cluster using VinaLC it could be many ligands vs many proteins using multithreading 

------------First Script-------------------
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

receptor = 5JMT.pdbqt 
center_x = -24.788 
center_y = 17.865
center_z = -21.964
size_x = 20.0
size_y = 22.0
size_z = 20.0
exhaustiveness = 8
num_modes = 1
------------------------------------------------------------


--------------------Second Script-------------------
For the second script "script_multidockin.sh" Again you should modify the config.txt file in the "out" line you should change the name of the output to say
"out=*_trol.pdbqt", is intended to use one protein and one ligand to perform multiple dockings repeteadly, so the line "ligand" remain the same 


--------------------Third Script---------------------
the las one "ScriptVinaLC.sh" is intended to send a job to a cluster, the rules chnge a little bit this is an example we use in our cluster
using one node of 12 cores but you can change the options to uses as many as yo were able to do, the most important part is the preparation for
the files "ligands" and "proteins". Puedes encontrar informacion detallada en la pagina de los creadores de esta version de vina https://plsuser.llnl.gov/bbs/vinalc/tutorial.html. The most important is to put the ligands inside a directory called data and each individual
ligand must contain the word MODEL and ENDMDL at the begining and end of each pdbqt file, also the receptor file, ligands list and geometry files 
must comply with the sintax characteristics in order to run, here we put and example of this files.







