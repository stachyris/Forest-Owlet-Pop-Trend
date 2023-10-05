#PBS -N consensus_from_bam
#PBS -q iiser
#PBS -l select=1:ncpus=20
#PBS -l walltime=96:00:00
#PBS -V
#PBS -o consensus_from_bam.o
#PBS -e consensus_from__bam.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

REFERENCE=/home/naman/vinay/WGS_100x/split/test/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa
BCFTOOLS=/home/naman/soft/bcftools-1.10.2/bin/bcftools
VCFUTILS=/home/naman/soft/bcftools-1.10.2/bin/vcfutils.pl

$BCFTOOLS mpileup -C50 -f $REFERENCE FO_100x_adaptersmarked_aligned_merged_dupes_marked_aut.bam | $BCFTOOLS call -c - | $VCFUTILS vcf2fq -d 10 -D 100 | gzip > FO_100x_diploid.fq.gz
