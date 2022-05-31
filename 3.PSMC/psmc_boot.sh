#PBS -N psmc_boot
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o psmc_boot.o
#PBS -e psmc_boot.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test/psmc/bootstrap
 
command 

PSMC_path=/home/naman/soft/psmc/

$PSMC_path/utils/splitfa ../FO_100x.psmcfa > FO_100x_aut_split.psmcfa

$PSMC_path/psmc -N25 -t9 -r5 -p "26*2+4+7+1" -o FO_100x-8c.psmc ../FO_100x.psmcfa

 
seq 100 | xargs -i -n 1 -P 80 echo $PSMC_path/psmc -N25 -t9 -r5 -b -p "26*2+4+7+1" -o FO_100x_aut_round-{}.psmc FO_100x_aut_split.psmcfa | sh

cat ../FO_100x-8c.psmc FO_100x_aut_round-*.psmc > FO_100x_aut-8c-combined.psmc
