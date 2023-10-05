#PBS -N sam_bam_merge
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o sam_bam_merge.o
#PBS -e sam_bam_merge.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test
 
command 
java -jar /home/Workshop-Genomics/softs/picard.jar MergeBamAlignment ALIGNED_BAM=FO_100x.adaptersmarked.aligned.sam UNMAPPED_BAM=FO_100x.adaptersmarked.unmapped.bam OUTPUT=FO_100x_aligned_merged.bam REFERENCE_SEQUENCE=/home/naman/vinay/WGS_100x/split/test/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa MAX_INSERTIONS_OR_DELETIONS=-1 PRIMARY_ALIGNMENT_STRATEGY=MostDistant ATTRIBUTES_TO_RETAIN=XS
