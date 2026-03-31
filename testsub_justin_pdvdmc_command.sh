#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

EOF

WOB="np04"
DET="pdvd"

MCJOBS=1
NEVTS=1

#yaml=${DET}_w${WOB}_spsneutrino_mc.yaml
yaml=${DET}_w${WOB}_spsneutrino_g4only_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_training_data.yaml
#yaml=${DET}_w${WOB}_spsneutrino_protodunebsmwindow_triggeronly_mc.yaml

justin-test-jobscript --jobscript apr2025_generic_mcprod.jobscript \
  --env DUNESW_VERSION=v10_17_02d00 --env UTIL_TAR=$util_tar_pdvd --monte-carlo ${MCJOBS} --env "NEVENTS=${NEVTS}" \
  --env pipyaml=1 --env YAMLFILE=${yaml} --env JSONFILE=${DET}_w${WOB}_base_meta.json --env MCJob=1 #--env DUNESW_TAR=$localprod_tar_pdvd
