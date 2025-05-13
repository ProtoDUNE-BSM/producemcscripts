# producemcscripts
Set of scripts to produce MC simulations in PD-HD using Justin and the DUNE Grid.

We have a yaml and fcl file for each type of T2 wobbling configuration available to process. Each yaml file calls the associated fcl file for a chosen magnet wobbling configuration. Only the generator stage differs by wobbling configuration. All the following stages after generator are common to each magnet wobbling configuration.

First thing is needed is to get the correct certificates and generate a tarball to be uploaded with the job.

```
kinit -f ${USER}
kx509
voms-proxy-init --noregen -rfc -voms dune:/dune/Role=Analysis
(certificate system changing soon though)

setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

source tarball.sh
```

Running `tarball.sh` loads all of the scripts into a tarball with the env variable `$util_tar`. This is uploaded to the justin job.

To then process data use `standardsub_justin_pdhdmc_command.sh`. Edit the `WOB` variable in this bash script to change the wobbling configuration code (`np04`, `133`, or `000`). I could make these options command-line editable if it is useful.

N.B. fluxes for wobbling confuration `000` exist but configuration files not included yet as no PD-HD with `000` wobbling configuration exists, so MC productions are not yet necessary.

```
source standardsub_justin_pdhdmc_command.sh
```
Will submit a workflow for simulating neutrinos with the `WOB` code of choice.

Changing the `WOB` code changes the `.yaml` configuration file and `.json` file for the metadata. The `.yaml` file for a calls the correct `.fcl` file, which loads the correct flux files for that magnet configuration. The two `.yaml` files for `np04` and `133` are 
```
pdhd_wnp04_spsneutrino_mc.yaml
pdhd_w133_spsneutrino_mc.yaml
```
Likewise, the corresponding `.json` files for the metadata are
```
pdhd_wnp04_base_meta.json
pdhd_w133_base_meta.json
```
The variable `MCJOBS` determines how many MC jobs will be a part of the workflow. The variable `NEVTS` is how many events there will be per MC job. Multiply `MCJOBS` and `NEVTS` to get the total MC events to be simulated in workflow. A typical number of events per job is 10.

The justin workflow should also have the environment variables `--env MCJob=1` and `--env pipyaml=1` set. 

The `--scope` command-line input of `justin simple-workflow` is currently set to usertests as this is the only scope that is available to me. This should be changed.

For online testing you can also run `testsub_justin_pdhdmc_command.sh`.
