#PBS -N ubamtofq
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o ubam_to_fq.o
#PBS -e ubam_to_fq.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test
 
java -jar /home/Workshop-Genomics/softs/picard.jar SamToFastq INPUT=FO_100x.adaptersmarked.unmapped.bam FASTQ=FO_100x.adaptersmarked.fastq CLIPPING_ATTRIBUTE=XT CLIPPING_ACTION=2 INTERLEAVE=true
