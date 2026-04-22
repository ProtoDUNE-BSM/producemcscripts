#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune
justin get-token

source tarball_hd.sh

EOF

USERF=${USER}/ProtoDUNEBSM/PDHDBSMMC/Neutrino
FNALURL='https://fndcadoor.fnal.gov:2880/dune/scratch/users'

# Choose wobbling config - this controls the choice of SPS neutrino flux
WOB="np04"
# Choosing the PD-HD detector
DET="pdhd"

# Number of jobs to submit
MCJOBS=200
# Number of events per jobs - for full reco, 10 events gives ~2 GB files size, which is good
NEVTS=10

# Main PD-HD prduction .yaml file
yaml=${DET}_w${WOB}_spsneutrino_mc.yaml

# Many other .yaml files for different MC productions
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_mc.yaml
#yaml=${DET}_w${WOB}_spsneutrino_triggeronly_training_data.yaml
#yaml=${DET}_w${WOB}_spsneutrino_protodunebsmwindow_triggeronly_mc.yaml

justin simple-workflow --jobscript apr2025_generic_mcprod.jobscript \
  --rss-mb 6000 --env DUNESW_VERSION=v10_17_02d00 --env UTIL_TAR=$util_tar_pdhd --monte-carlo ${MCJOBS} --env "NEVENTS=${NEVTS}" \
  --env pipyaml=1 --env YAMLFILE=${yaml} --env JSONFILE=${DET}_w${WOB}_base_meta.json \
  --env MCJob=1 --scope usertests --lifetime-days 5 \
  --output-pattern "*_reco_stage2.root:output-test"
  
  # Many other types of output for different MC productions:
  #--output-pattern "*_trigger_tfile.root:${FNALURL}/${USERF}" --env DUNESW_TAR=$localprod_tar_pdhd 
  #--output-pattern "*_training_data.root:${FNALURL}/${USERF}" --env DUNESW_TAR=$localprod_tar_pdvd 
  #--output-pattern "*_protodunehd_*_reco_stage2.root:${FNALURL}/${USERF}" --env DUNESW_TAR=$localprod_tar_pdhd 
  #--output-pattern "*_training_data.root:${FNALURL}/${USERF}"
  #--output-pattern "*_trigger.root:output-test"
  #--output-pattern "*_protodunehd_*_reco_stage2.root:${FNALURL}/${USERF}"
