#!/bin/bash                                                                                                                                                                                              
#source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh

setup root v6_22_08d -q e20:p392:prof
setup pythia v6_4_28r -q gcc930:prof
setup log4cpp v1_1_3c -q e20:prof
setup lhapdf v6_3_0 -q e20:p392:prof
setup cmake v3_20_0

setup genie v3_04_00 -q e20:prof
setup genie_xsec v3_04_00 -q AR2320i00000:e1000:k250
