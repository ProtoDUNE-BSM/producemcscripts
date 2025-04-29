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

WOB="np04"

justin simple-workflow --jobscript apr2025_generic_mcprod.jobscript \
  --rss-mb 4000 --env DUNESW_VERSION=v10_05_00d00 --env UTIL_TAR=$util_tar --monte-carlo 1 --env "NEVENTS=10" \
  --env pipyaml=1 --env YAMLFILE=pdhd_w${WOB}_spsneutrino_mc.yaml --env JSONFILE=pdhd_w${WOB}_base_meta.json \
  --env MCJob=1 --scope usertests --lifetime-days 2 \
  --output-pattern "*_protodunehd_*.root:${FNALURL}/${USERF}"
  #--output-pattern "*_protodunehd_*.root:output-test"
  #--output-pattern "*_pdhdreco2_*.root:${FNALURL}/${USERF}"
