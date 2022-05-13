#!/bin/sh
# #SBATCH --time=12:00:00
#SBATCH --time=00:10:00
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --tasks-per-node=90
#SBATCH --cpus-per-task=1
#SBATCH --partition=standard
#SBATCH --qos=short
# SBATCH --qos=standard
##SBATCH --reservation=shortqos


# hardwire budget if you wish to over-ride default
#export HECACC=n02-NEI025867
#export HECACC=n02-NEM001660


echo "GOT HERE RUN REPEAT"

module load PrgEnv-gnu
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel

cd $SLURM_SUBMIT_DIR/../run_ad

export OMP_NUM_THREADS=1
srun --distribution=block:block --hint=nomultithread ./mitgcmuv_ad  # > out.txt 2> err.txt
echo not yet doing rm oad_cp*

exit
