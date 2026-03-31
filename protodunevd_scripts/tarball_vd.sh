#!/bin/bash

tar -cf beam_job_utils_pdvd.tar \
  beam_job_utils.py \
  pdvd_wnp04_base_meta.json \
  pdvd_w133_base_meta.json \
  pdvd_cosmic_base_meta.json \
  pdvd_wnp04_spsneutrino_mc.yaml \
  pdvd_wnp04_spsneutrino_triggeronly_mc.yaml \
  pdvd_w133_spsneutrino_triggeronly_mc.yaml \
  pdvd_wnp04_spsneutrino_protodunebsmwindow_triggeronly_mc.yaml \
  pdvd_w133_spsneutrino_mc.yaml \
  pdvd_w133_spsneutrino_genonly_mc.yaml \
  pdvd_cosmic_rad_trigger_mc.yaml \
  pdvd_wnp04_spsneutrino_triggeronly_training_data.yaml \
  pdvd_w133_spsneutrino_g4only_mc.yaml \
  pdvd_wnp04_spsneutrino_g4only_mc.yaml \
  prod_wnp04_beamneutrino_cosmic_protodunevd.fcl \
  prod_w133_beamneutrino_cosmic_protodunevd.fcl \
  prod_wnp04_beamneutrino_protodunevd.fcl \
  prod_w133_beamneutrino_protodunevd.fcl \
  prod_cosmic_rad_protodunevd.fcl \
  genie_protodunevd.fcl \
  standard_g4_protodunevd_nophoton.fcl \
  standard_detsim_protodunevd_elecgain7d8_nophoton.fcl \
  triggersim_protodunevd_simpleThr_simpleWin_simpleWin_bsmtriggerparams.fcl \
  triggersim_protodunevd_simpleThr_ProtoDUNEBSMWin_simpleWin_bsmtriggerparams.fcl \
  triggersim_protodunevd_simpleThr_simpleWin_simpleWin_bsmtriggerparams_wtrainingdata.fcl \
  standard_reco_stage1_protodunevd_MC_elecgain7d8.fcl \
  standard_reco_stage2_protodunevd_MC_nophoton_elecgain7d8.fcl  

util_tar_pdvd=`justin-cvmfs-upload beam_job_utils_pdvd.tar`
