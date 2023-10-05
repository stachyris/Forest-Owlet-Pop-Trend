#PBS -N extract_aut_bam
#PBS -q iiser
#PBS -l select=1:ncpus=20
#PBS -l walltime=96:00:00
#PBS -V
#PBS -o extract_aut_bam.o
#PBS -e extract_aut_bam.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

/home/Workshop-Genomics/softs/samtools-1.10/samtools view -b -L chromosome_scaffolds_aut.bed FO_100x_adaptersmarked_aligned_merged_dupes_marked.bam > FO_100x_adaptersmarked_aligned_merged_dupes_marked_aut.bam 
