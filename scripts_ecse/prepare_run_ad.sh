#!/bin/bash
################################################
# Clean out old results and link input files.
################################################



# Empty the run directory - but first make sure it exists!
if [ -d "../run_ad" ]; then
  cd ../run_ad
  rm -rf *
else
  echo 'There is no run directory'
  exit 1
fi

echo "GOT HERE PREPARE"
echo $PWD

ln -s ../input_ad/* . 

# Deep copy of the master namelist (so it doesn't get overwritten in input/)
rm -f data
cp -f ../input_ad/data .


# Link executables
ln -s ../build_ad/mitgcmuv_ad .
