#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

EOF

USERF=${USER}/ProtoDUNEBSM/PDHDBSMMC/Neutrino
FNALURL='https://fndcadoor.fnal.gov:2880/dune/scratch/users'

# Choice of wobbling configuration - controls choice of neutrino flux
WOB="133"
# Choosing the PD-VD detector
DET="pdvd"

MCJOBS=10
NEVTS=100

#yaml=${DET}_w${WOB}_spsneutrino_mc.yaml
yaml=${DET}_w${WOB}_spsneutrino_g4only_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_training_data.yaml
#yaml=${DET}_w${WOB}_spsneutrino_protodunebsmwindow_triggeronly_mc.yaml

justin simple-workflow --jobscript apr2025_generic_mcprod.jobscript \
  --rss-mb 6000 --env DUNESW_VERSION=v10_17_02d00 --env UTIL_TAR=$util_tar_pdvd --monte-carlo ${MCJOBS} --env "NEVENTS=${NEVTS}" \
  --env pipyaml=1 --env YAMLFILE=${yaml} --env JSONFILE=${DET}_w${WOB}_base_meta.json \
  --env MCJob=1 --scope usertests --lifetime-days 2 \
  --output-pattern "*_g4.root:output-test"
  #--output-pattern "*_reco_stage2.root:output-test"
  #--output-pattern "*_trigger_tfile.root:${FNALURL}/${USERF}" --env DUNESW_TAR=$localprod_tar_pdhd 
  #--output-pattern "*_training_data.root:${FNALURL}/${USERF}" --env DUNESW_TAR=$localprod_tar_pdvd 
  #--output-pattern "*_protodunehd_*_reco_stage2.root:${FNALURL}/${USERF}" --env DUNESW_TAR=$localprod_tar_pdvd 
  #--output-pattern "*_training_data.root:${FNALURL}/${USERF}"
  #--output-pattern "*_trigger.root:output-test"
  #--output-pattern "*_protodunehd_*_reco_stage2.root:${FNALURL}/${USERF}"
  # --env DUNESW_TAR=$localprod_tar_pdvd
