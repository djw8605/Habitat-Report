#!/bin/sh
#PBS -l walltime=20:00:00
#PBS -l nodes=1:ppn=64
#PBS -l mem=2048
#PBS -t 0-29

cd $PBS_O_WORKDIR
tmp_dir=`mktemp -d`
cp -r ./* $tmp_dir
cd $tmp_dir
export OMP_NUM_THREADS=$PBS_NUM_PPN
echo "For $OMP_NUM_THREADS cores"
module load compiler/gcc/4.7
time -p ./habitat.exe

rm -rf $tmp_dir