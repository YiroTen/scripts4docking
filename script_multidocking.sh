#!/bin/bash

a=1
while [ $a -le 100 ]
do 
    sed 's/trol/'$a'/g' config.txt > inp
    vina --config inp
    a=$(($a+1))
done

# se debe modificar el archivo config.txt
# el archivo salida debe decir (out = *_trol.pdbqt)
# ejecutar desde terminal $bash script_multidocking.sh
# este script sirve para hacer muchos dockings con el mismo
# ligando y la misma proteína
