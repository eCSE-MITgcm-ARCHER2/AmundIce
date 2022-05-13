#!/bin/bash
################################################
# Clean out old results and link input files.
################################################



# Empty the run directory - but first make sure it exists!
if [ -d "../run_ad" ]; then
  echo run_ad exists - remove it first
  exit
else
  echo "make run_ad"
  mkdir ../run_ad
  cd ../run_ad
fi

echo "GOT HERE PREPARE"
echo $PWD

ln -s ../input_ad/* . 

# Deep copy of the master namelist (so it doesn't get overwritten in input/)
rm -f data
cp -f ../input_ad/data .


# Link executables
ln -s ../build_ad/mitgcmuv_ad .
