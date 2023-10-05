#PBS -N qualimap
#PBS -q iiser
#PBS -l select=1:ncpus=20
#PBS -l walltime=96:00:00
#PBS -V
#PBS -o qualimap.o
#PBS -e qualimap.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

/home/naman/soft/qualimap_v2.2.1/qualimap bamqc -bam FO_100x_aligned_merged.bam --collect-overlap-pairs --outdir ./
