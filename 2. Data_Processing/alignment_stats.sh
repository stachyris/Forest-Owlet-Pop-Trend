#PBS -N alignment_stats
#PBS -q iiser
#PBS -l select=1:ncpus=10
#PBS -l walltime=96:00:00
#PBS -V
#PBS -o alignment_stats.o
#PBS -e alignments_stats.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

/home/Workshop-Genomics/softs/samtools-1.10/samtools flagstat FO_100x_adaptersmarked_aligned_merged_dupes_marked.bam > FO_100x_alignment_stats.txt 
