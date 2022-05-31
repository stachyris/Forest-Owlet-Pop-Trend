#PBS -N bwa_ref_map
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o mapping.o
#PBS -e mapping.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test
 
bwa mem -t 40 -p -M ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa FO_100x.adaptersmarked.fastq > FO_100x.adaptersmarked.aligned.sam
