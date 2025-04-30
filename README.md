# producemcscripts
Set of scripts to produce MC simulations in PD-HD using Justin and the DUNE Grid.

We have a yaml and fcl file for each run available to process. Each yaml file calls the associated fcl file for a chosen magnet wobbling configuration.

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
```
source standardsub_justin_pdhdmc_command.sh
```
Will submit a workflow for simulating neutrinos with the `WOB` code of choice.

Changing the `WOB` code changes the `.yaml` configuration file and `.json` file for the metadata. The `.yaml` file for a calls the correct `.fcl` file, which loads the correct flux files for that magnet configuration.

The variable `MCJOBS` determines how many MC jobs will be a part of the workflow. The variable `NEVTS` is how many events there will be per MC job. Multiply `MCJOBS` and `NEVTS` to get the total MC events to be simulated in workflow. A typical number of events per job is 10.

The `--scope` command-line input of `justin simple-workflow` is currently set to usertests as this is the only scope that is available to me. This should be changed.

For online testing you can also run `testsub_justin_pdhdmc_command.sh`.
