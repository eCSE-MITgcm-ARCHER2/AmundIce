# Instructions to run AMUND_ICE, which will calculate adjoint sensitivities from a 20-year run of an amundsen sea configuration of the MITgcm STREAMICE package.

0. clone MITgcm from github -  Will need to point to DNG pull request branch for now:
>  git clone git@github.com:dngoldberg/MITgcm.git 

1. Set the environment variable ROOTDIR to the location of your MITgcm source. Its suggested to use 

2. [clone git repo? need to fill in details of where this will be found -- eg through eCSE git organisation]

   The directories 
    input_ecse
    code_ecse
    scripts_ecse
   will be cloned into a local repository.

BUILD THE EXECUTABLE.

3. change to scripts_ecse directory.
4. update "make_archer.sh" with locations of OpenAD singularity image and PETSc installation
5. run the "make_archer.sh" script. (The build should require ~15 minutes)


SUBMIT THE EXECUTABLE.

6. run the script "submit_ad.sh". (The script should run on 90 cpus on a single node, and should last approx runtime 4-5 hours)

CHANGE THE NUMBER OF CPUs

7. To modify the cpu count, 2 changes must be made:
a) the SLURM header of scripts_ecse/run.slurm should be changed to reflect nodes and cpus per node (currently 1 and 90, resp)
b) sNx (sNy) and nPx (nPy) of code_ecse/SIZE.h should be modified, such that the products sNx*nPx and sNy*nPy remain constant. Executable must be rebuilt.

TURN OFF USE OF PETSC

8. in input_ecse/data.streamice set "streamice_use_petsc = .false.". No recompilation is necessary.

SET A DIFFERENT RUN TIME

9. currently the model does a 20-year simulation with 240 1-month time steps. To modify this change "nTimeSteps" within input_ecse/data. 
