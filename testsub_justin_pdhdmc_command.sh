#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

EOF

WOB="np04"

MCJOBS=1
NEVTS=1

justin-test-jobscript --jobscript apr2025_generic_mcprod.jobscript \
  --env DUNESW_VERSION=v10_05_00d00 --env UTIL_TAR=$util_tar --monte-carlo ${MCJOBS} --env "NEVENTS=${NEVTS}" \
  --env pipyaml=1 --env YAMLFILE=pdhd_w${WOB}_spsneutrino_mc.yaml --env JSONFILE=pdhd_w${WOB}_base_meta.json --env MCJob=1
