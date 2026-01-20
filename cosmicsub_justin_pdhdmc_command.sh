#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

EOF

USERF=${USER}/ProtoDUNEBSM/PDHDBSMMC/Cosmic
FNALURL='https://fndcadoor.fnal.gov:2880/dune/scratch/users'

MCJOBS=500
NEVTS=10

justin simple-workflow --jobscript apr2025_generic_mcprod.jobscript \
  --rss-mb 6000 --env DUNESW_VERSION=v10_12_02d00 --env UTIL_TAR=$util_tar --monte-carlo ${MCJOBS} --env "NEVENTS=${NEVTS}" \
  --env pipyaml=1 --env YAMLFILE=pdhd_cosmic_rad_trigger_mc.yaml --env JSONFILE=pdhd_cosmic_base_meta.json \
  --env MCJob=1 --scope usertests --lifetime-days 2 \
  --output-pattern "*_trigger.root:output-test"
  #--output-pattern "*_protodunehd_*_reco_stage2.root:${FNALURL}/${USERF}"
