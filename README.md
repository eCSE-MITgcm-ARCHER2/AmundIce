[![DOI](https://zenodo.org/badge/490702234.svg)](https://zenodo.org/badge/latestdoi/490702234)

# AmundIce
AmundIce calculates adjoint sensitivities from a 20-year run of an amundsen sea configuration of the MITgcm STREAMICE package.
The repository has files for running on Archer2

## Overview 
 - HowToInstall.md : guidance on installation and running
 - scripts_ecse: scripts to be copied and used for a new case
 - input_ecse: data files, some of which can be linked to (bin) but some need to eb edited to change the configuration of a run.
 - code_ecse: code specific to AmundIce

## PETSc
This was built following the guidance at https://github.com/ARCHER2-HPC/pe-scripts/tree/cse-develop
The build for the eCSE project is at:
export MY_PETSC_DIR=/work/n02/shared/mjmn02/AmundIce/TPSL/GNU
For associated scripts, see the ecse-scripts directory in this repository

## OpenAD
HowToInstall.md gives guidance including on use of the containerised OpenAD.  Thhe definition of the containier is held in test.def.
