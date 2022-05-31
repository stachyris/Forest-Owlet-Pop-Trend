#PBS -N depth_stats_raw
#PBS -q iiser
#PBS -l select=1:ncpus=10
#PBS -l walltime=96:00:00
#PBS -V
#PBS -o depth_stats_raw.o
#PBS -e depth_stats_raw.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test

java -jar /home/naman/soft/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T DepthOfCoverage -nt 10 -R /home/naman/vinay/WGS_100x/split/test/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa -I FO_100x_adaptersmarked_aligned_merged_dupes_marked.bam  -o depth_stats_raw --omitIntervalStatistics --omitDepthOutputAtEachBase
