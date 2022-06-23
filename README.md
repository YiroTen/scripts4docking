The first script is to automate many dockings vs the same protein <br>
The second one is to perform docking of one protein vs one ligand many times obtain statistics from dockings  <br>
The third one is to permorm dockings in a cluster using VinaLC it could be many ligands vs many proteins using multithreading <br>

### First Script
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

### example of config.txt file
----------------------------------------------------------

receptor = 5JMT.pdbqt <br /> 
center_x = -24.788 <br />
center_y = 17.865 <br />
center_z = -21.964 <br />
size_x = 20.0 <br />
size_y = 22.0 <br />
size_z = 20.0 <br />
exhaustiveness = 8 <br />
num_modes = 1 <br />

------------------------------------------------------------

### Second Script
For the second script "script_multidocking.sh" Again you should modify the config.txt file in the "out" line you should change the name of the output to say
"out=*_trol.pdbqt", is intended to use one protein and one ligand to perform multiple dockings repeteadly, so the line "ligand" remain the same 

### Third Script
the las one "ScriptVinaLC.sh" is intended to send a job to a cluster, the rules chnge a little bit this is an example we use in our cluster
using one node of 12 cores but you can change the options to uses as many as yo were able to do, the most important part is the preparation for
the files "ligands" and "proteins". Puedes encontrar informacion detallada en la pagina de los creadores de esta version de vina https://plsuser.llnl.gov/bbs/vinalc/tutorial.html. The most important is to put the ligands inside a directory called data and each individual
ligand must contain the word MODEL and ENDMDL at the begining and end of each pdbqt file, also the receptor file, ligands list and geometry files 
must comply with the sintax characteristics in order to run, here we put and example of this files.

You should create three txt files, one with ligands names, one with receptors (proteins names) and one with the geometry, box size for docking and center coordenates
in this example 4 dockings will result from 2 ligands vs 2 proteins, the geoList must contain the center coordenates with 3 decimals and its size with 2 decimals in that order
the first line of coordenates "geoList" must correspond with the the first protein  "protA" the second line with "protB" and so on. Remembeer these are only the lists wich VinaLC will read to perform the docking. Besides you should have the pdbqt files of proteins and the pdbqt files of ligands inside a directory called data.


### example of ligands, receptors and geometry files
<table class="default">

  <tr>
    <th>Ligands <br> ligList.txt</th>
    <th>Receptors <br> recList.txt</th>
    <th>Geometry <br> geoList.txt</th>
  </tr>
  <tr>
    <td>./data/ligand1.pdbqt</td>
    <td>1KIJ_protA.pdbqt</td>
    <td>18.301 1.380 43.558 39.75 39.75 39.75</td>
  </tr>
  <tr>
    <td>./data/ligand2.pdbqt</td>
    <td>1KIJ_protB.pdbqt</td>
    <td>18.301 1.380 43.558 39.75 39.75 39.75</td>
  </tr>
 
  </tr>
</table>
<br>
<br>
<br>
<br>
¡ Happy Docking !
<br>
<br>
<br>
<br>

Also we strongly recomend you to see the videos about docking from one of our colaborators Andres Reyes
https://www.youtube.com/c/Andryech

If these scripts are useful for you, please cite our work.

if you find this repo in an article please cite that article, otherwise you can cite one of the next articles. 

"Tenorio-Barajas AY, Nicolás-Álvarez DE, Reyes-Chaparro A, Mendoza-Barrera C, Magaña-Trejo B, Altuzar V. Comparison of performance of two virtual screening software on acetylcholinesterase protein molecular docking. In2021 18th International Conference on Electrical Engineering, Computing Science and Automatic Control (CCE) 2021 Nov 10 (pp. 1-4). IEEE." <br >

"Hernández-Santoyo, A., Tenorio-Barajas, A. Y., Altuzar, V., Vivanco-Cid, H., & Mendoza-Barrera, C. (2013). Protein-protein and protein-ligand docking. Protein engineering-technology and application, 63-81."














