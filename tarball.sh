#!/bin/bash

tar -cf beam_job_utils.tar \
  beam_job_utils.py \
  pdhd_wnp04_base_meta.json \
  pdhd_w133_base_meta.json \
  pdhd_wnp04_spsneutrino_mc.yaml \
  pdhd_w133_spsneutrino_mc.yaml \
  prod_wnp04_beamneutrino_cosmic_protodunehd.fcl \
  prod_w133_beamneutrino_cosmic_protodunehd.fcl \
  genie_protodunehd.fcl \
  standard_g4_protodunehd_nophoton.fcl \
  standard_detsim_protodunehd_elecgain7d8_nophoton.fcl \
  triggersim_protodunehd_simpleThr_simpleWin_simpleWin_bsmtriggerparams.fcl \
  standard_reco_stage1_protodunehd_MC_elecgain7d8.fcl \
  standard_reco_stage2_protodunehd_MC_nophoton_elecgain7d8.fcl  

util_tar=`justin-cvmfs-upload beam_job_utils.tar`
