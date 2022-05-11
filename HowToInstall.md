# Instructions to run AMUND_ICE

Its suggested you have a directory tree in /work/..... (Not /home ) of the form
./Singularity
./eCSE-archer2-AmundIce
./eCSE-archer2-AmundIce/.git
./eCSE-archer2-AmundIce/scripts_ecse
./eCSE-archer2-AmundIce/code_ecse
./eCSE-archer2-AmundIce/input_ecse
./MITgcm/MITgcm


0. Download MITgcm and then the Singularity container for OpenAd and this github:
Create directory and cd into it then
>  git clone git@github.com:dngoldberg/MITgcm.git 
Create directory and cd into it then
>  singularity pull library://jahn/default/openad:latest



1. Download/copy files
> git clone git@github.com:eCSE-MITgcm-ARCHER2/eCSE-archer2-AmundIce.git
   The directories 
    input_ecse
    code_ecse
    scripts_ecse
   will be cloned into a local repository.

2. Set the envioroanment variables in scripts_ecse/case_setup, a script used to have a unique place to set your environment for making and for runs.
 - Set the environment variable ROOTDIR to the location of your MITgcm source.

SET UP A CASE, e.g. when running tests with 90 cores and O3 optimisation: 
mkdir ./cases/90/O3 
cp -r ./eCSE-archer2-AmundIce/scripts_ecse ./cases/90/O3/scripts

3. Create a "case" directory: it will have subdirectories
./scripts  A copy of scripts_ecse edited for this case
./build where the executable is built
./run where the run is made.

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
