#!/bin/bash
#------------------------------------------------------------------------------
# DEM run script for FinesColumn testcase
# init FinesColumn
# Thomas Lichtenegger - June 2023
#------------------------------------------------------------------------------

#- source CFDEM env vars
. ~/.bashrc

#- include functions
source $CFDEM_PROJECT_DIR/etc/functions.sh

echo "starting DEM run in parallel..."
#------------------------------------------------------------------------------
#- define variables
casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"
logpath="$casePath"
headerText="run_liggghts_init_DEM"
logfileName="log_$headerText"
solverName="in.liggghts_init"
nrProcs=8
machineFileName="none"
debugMode="off"
#------------------------------------------------------------------------------

#- call function to run DEM case
parDEMrun $logpath $logfileName $casePath $headerText $solverName $nrProcs $machineFileName $debugMode

