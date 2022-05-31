#PBS -N mark_dupes
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o mark_dupes.o
#PBS -e mark_dupes.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test
 
command 
java -jar /home/Workshop-Genomics/softs/picard.jar MarkDuplicates INPUT=FO_100x_aligned_merged.bam OUTPUT=FO_100x_adaptersmarked_aligned_merged_dupes_marked.bam METRICS_FILE=FO_100x_adaptersmarked_aligned_merged_dupes_marked_metrics.txt CREATE_INDEX=true
