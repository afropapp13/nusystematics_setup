#!/bin/bash

OUTPUTFOLDER=/sbnd/data/users/apapadop/nusystematics
FLUXFILE=/pnfs/sbnd/persistent/users/apapadop/Fluxes/sbnd_flux.root,flux_sbnd_numu
TARGET=1000180400
TARGETFRACTION=1.0
RUNNUMBER=1
PARTICLE=14
INTERACTION=Default
EVENTS=100
ENERGY_MIN=0.
ENERGY_MAX=10.
TUNE=AR23_20i_00_000
CARD=sbnd_nuisance.xml

gevgen -n ${EVENTS} -r $RUNNUMBER -p ${PARTICLE} -t ${TARGET}[${TARGETFRACTION}] -e ${ENERGY_MIN},${ENERGY_MAX}  -f ${FLUXFILE} --cross-sections ${GENIEXSECFILE} --event-generator-list ${INTERACTION} -o ${OUTPUTFOLDER}/${PARTICLE}_${TARGET}_${INTERACTION}_${TUNE}.ghep.root --tune ${TUNE}

PrepareGENIE -i ${OUTPUTFOLDER}/${PARTICLE}_${TARGET}_${INTERACTION}_${TUNE}.ghep.root -t ${TARGET}[1.] -o ${OUTPUTFOLDER}/${PARTICLE}_${TARGET}_${INTERACTION}_${TUNE}.gprep.root -f ${FLUXFILE}

nuisflat -f GenericFlux -i GENIE:${OUTPUTFOLDER}/${PARTICLE}_${TARGET}_${INTERACTION}_${TUNE}.gprep.root -o ${OUTPUTFOLDER}/${PARTICLE}_${TARGET}_${INTERACTION}_${TUNE}.gflat.root -c ${CARD} -n ${EVENTS}

rm input-flux.root
rm ${OUTPUTFOLDER}/*.status
