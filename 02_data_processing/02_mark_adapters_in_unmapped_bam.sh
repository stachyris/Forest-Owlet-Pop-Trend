#PBS -N mark_adapters
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o mark_adapters.o
#PBS -e mark_adapters.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

java -jar /home/Workshop-Genomics/softs/picard.jar MarkIlluminaAdapters \
  INPUT=FO_100x_unmapped.bam \
  OUTPUT=FO_100x.adaptersmarked.unmapped.bam \
  METRICS=FO_100x.adaptersmarked.txt
