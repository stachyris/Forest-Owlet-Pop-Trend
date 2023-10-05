#PBS -N trim
#PBS -q iiser
#PBS -l select=1:ncpus=20
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o trim.o
#PBS -e trim.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x

command
mpirun -np 20 /home/Workshop-Genomics/softs/TrimGalore-0.6.5/trim_galore --quality 30 --phred33 --stringency 2 --length 30 --max_n 2 --trim-n --output_dir ./ --paired --retain_unpaired -j 20 fo_read1.fastq.gz fo_read2.fastq.gz 
