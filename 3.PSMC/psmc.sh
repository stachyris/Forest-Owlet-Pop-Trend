#PBS -N psmc
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -l walltime=96:00:00
#PBS -o psmc.o
#PBS -e psmc.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/naman/vinay/WGS_100x/split/test/psmc
 
command 

PSMC_path=/home/naman/soft/psmc/

$PSMC_path/utils/fq2psmcfa -q20 ../FO_100x_diploid.fq.gz > FO_100x.psmcfa

$PSMC_path/psmc -N25 -t9 -r5 -p "26*2+4+7+1" -o FO_100x-8c.psmc FO_100x.psmcfa

$PSMC_path/utils/psmc2history.pl FO_100x-8c.psmc | $PSMC_path/utils/history2ms.pl > ms-cmd-8c.sh
