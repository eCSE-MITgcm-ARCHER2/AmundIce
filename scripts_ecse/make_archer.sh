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
git checkout branch_streamice_updates
cd $OLDPWD

# why was this here - new directory.... make CLEAN

###### WILL NEED TO CHANGE ############
sing_str="-B $PWD:$HOME $AMUND_OAD"

$MITGCM_ROOTDIR/tools/genmake2 -mods='../code' -of=../scripts/dev_linux_amd64_gfortran_archer2_oad -oad -mpi --oadsingularity $sing_str
#ln -s $PETSCDIR/include/*.mod .
#echo $LD_LIBRARY_PATH
make adAll

