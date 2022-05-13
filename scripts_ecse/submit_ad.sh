#!/bin/bash
################################################
# Start a self-resubmitting simulation.
################################################

# ID number for run
JOBNO=00

# clean run directory and link all required files

# record start times
TIMEQSTART="$(date +%s)"
#echo Start-time `date` >> ../run_forward/times
echo Start-time `date` >> ../run_ad/times

echo not running  ./prepare_run_ad.sh
echo permit edits after user runs prepare.... and before the sbatch.
echo so please run prepare.sh then this, both from scripts directory.

echo DOTSON_$JOBNO
echo $JOBNO
echo $TIMEQSTART
echo $HECACC
# submit the job chain
sbatch --job-name=AMUND$JOBNO -A $HECACC run.slurm
#qsub -A $HECACC run.sh
