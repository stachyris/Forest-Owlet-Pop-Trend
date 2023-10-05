#PBS -N ubam
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o fq_to_ubam.o
#PBS -e fq_to_ubam.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

INDIR=/home/naman/vinay/WGS_100x/RAW/

R1=$(echo $INDIR*R1_001.fastq.gz)
R2=$(echo $INDIR*R2_001.fastq.gz)

header=$(zcat $R1 | head -n 1)
id=$(echo $header | head -n 1 | cut -f 1-4 -d":" | sed 's/@//' | sed 's/:/_/g')

sm=FO_100x

java -jar /home/Workshop-Genomics/softs/picard.jar FastqToSam \
F1=$R1 \
F2=$R2 \
OUTPUT=FO_100x_unmapped.bam \
READ_GROUP_NAME=$(echo $id) \
SAMPLE_NAME=$sm \
LIBRARY_NAME=Illumina_WGS_100x \
PLATFORM_UNIT=$(echo $id) \
PLATFORM=Illumina
