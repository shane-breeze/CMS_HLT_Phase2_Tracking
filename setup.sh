#!/bin/bash
export PYTHONPATH=$PYTHONPATH:$PWD
export SCRAM_ARCH=slc7_amd64_gcc820
export CMSSW_BASE=CMSSW_11_1_0_pre3
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r ${CMSSW_BASE}/src ] ; then
    echo release ${CMSSW_BASE} already exists
else
    scram p CMSSW ${CMSSW_BASE}
fi
cd ${CMSSW_BASE}/src
eval `scram runtime -sh`

scram b
cd ../../
