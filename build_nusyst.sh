#!/bin/bash

source global_vars.sh

mkdir nusyst_dev; cd nusyst_dev
export BASE="$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )" && pwd )"
echo "Base dir = " ${BASE}
mkdir nusystematics; cd nusystematics
git clone https://github.com/luketpickering/nusystematics-merge.git nusystematics-src
mkdir build_nusyst; cd build_nusyst
cmake ../nusystematics-src/
make install

source Linux/bin/setup.nusystematics.sh

cd ${BASE}
mkdir nuisance; cd nuisance
git clone https://github.com/NUISANCEMC/nuisance.git nuisance-src

mkdir build_nuisance; cd build_nuisance
#DGENIE_ENABLED=ON means it will work with GENIE, we aren't using DProb3plusplus_ENABLED so we turn it off, and enable nysytematics 
cmake ../nuisance-src -DGENIE_ENABLED=ON -DProb3plusplus_ENABLED=OFF -Dnusystematics_ENABLED=ON 
make install
