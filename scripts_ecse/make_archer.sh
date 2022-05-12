#!/bin/bash

# run in case's script directory
. ./case_setup

export LD_LIBRARY_PATH=$CRAY_LD_LIBRARY_PATH:$LD_LIBRARY_PATH

if [ -d "../build_ad" ]; then
  cd ../build_ad
  rm -rf *
else
  echo 'Creating build directory'
  mkdir ../build_ad
  cd ../build_ad
fi


cd $MITGCM_ROOTDIR
git checkout streamic_petsc_3_8_update
# see https://github.com/dngoldberg/MITgcm/tree/streamic_petsc_3_8_update

cd $OLDPWD

echo back in $PWD after the git checkout

# why was this here - new directory.... make CLEAN

# noting the AMUND_OAD is set in case_setup.
#... as is the ROOTDIR

sing_str="-B $PWD:$HOME,$MITGCM_ROOTDIR /work/n02/shared/mjmn02/AmundIce/Singularity/openad.sif"
#sing_str="-B $PWD:$HOME /work/n02/n02/dngoldbe/oad_sing/openad.sif"


    # to check singularity and this binding of directories, the following should create a file T in your present working directory
    # Adjust the PATH to be to your sif. 
echo write test file from singularity

rm -f TEST_SINGULARITY_BINDING
# fails. singularity exec '$sing_str'  touch TEST_SINGULARITY_BINDING
# fails singularity exec "$sing_str"  touch TEST_SINGULARITY_BINDING
 singularity exec $sing_str  touch TEST_SINGULARITY_BINDING

if [ -f TEST_SINGULARITY_BINDING ]
then
	echo singularity test passed
else
	echo singularity test failed - stopping
	exit
fi

# singularity exec --bind $PWD:$HOME /work/n02/shared/mjmn02/AmundIce/Singularity/openad_latest.sif touch T
    # You should see file T in the pwd
    # for details https://sylabs.io/guides/3.0/user-guide/bind_paths_and_mounts.html.



$MITGCM_ROOTDIR/tools/genmake2 -mods='../code' -of=../scripts/dev_linux_amd64_gfortran_archer2_oad -oad -mpi --oadsingularity="$sing_str"
ln -s $PETSC_DIR/include/*.mod .

echo ----------------------LD_LIBRARY_PATH --------------------
echo $LD_LIBRARY_PATH

echo calling make adAll
make adAll

