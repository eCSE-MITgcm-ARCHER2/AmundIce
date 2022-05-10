
module load PrgEnv-gnu
module swap cray-mpich  cray-mpich/8.1.4
module load cray-hdf5-parallel/1.12.0.3
module load cray-netcdf-hdf5parallel/4.7.4.3

###### WILL NEED TO CHANGE ############
PETSCDIR=/work/n02/n02/dngoldbe/petsc/


# module load nco/4.9.6-gcc-10.1.0
# module load ncview/ncview-2.1.7-gcc-10.1.0

export LD_LIBRARY_PATH=/work/n02/n02/dngoldbe/petsc/lib:$CRAY_LD_LIBRARY_PATH:$LD_LIBRARY_PATH

if [ -d "../build_ad" ]; then
  cd ../build_ad
  rm -rf *
else
  echo 'Creating build directory'
  mkdir ../build_ad
  cd ../build_ad
fi


cd $ROOTDIR
git checkout branch_streamice_updates
cd $OLDPWD

make CLEAN

###### WILL NEED TO CHANGE ############
sing_str="-B $PWD:$HOME /work/n02/n02/dngoldbe/oad_sing/openad.sif"

$ROOTDIR/tools/genmake2 -mods='../code_ecse' -of=../scripts_ecse/dev_linux_amd64_cray_archer2_oad -oad -mpi --oadsingularity $sing_str
ln -s $PETSCDIR/include/*.mod .
echo $LD_LIBRARY_PATH
make adAll

