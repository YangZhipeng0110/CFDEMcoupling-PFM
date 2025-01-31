#!/bin/bash
#------------------------------------------------------------------------------
# allrun script for periodic box test case
# run periodic box
# Behrad Esgandari - August 2023
#------------------------------------------------------------------------------

#- define variables
casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

#- include functions
source $CFDEM_PROJECT_DIR/etc/functions.sh

# check if mesh was built
if [ -f "$casePath/CFD/constant/polyMesh/points" ]; then
    echo "mesh was built before - using old mesh"
else
    echo "mesh needs to be built"
    cd $casePath/CFD
    blockMesh
fi

if [ -f "$casePath/DEM/post/restart/liggghts.restart" ];  then
    echo "LIGGGHTS init was run before - using existing restart file"
else
    #- run serial DEM
    $casePath/parDEMrun.sh
fi

#- run parallel CFD-DEM
bash $casePath/parCFDDEMrun.sh
