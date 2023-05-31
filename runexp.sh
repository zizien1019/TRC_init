#!/bin/bash
# The interpreter used to execute the script

#SBATCH --job-name=TracersRun
#SBATCH --mail-user=zizien@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=6
#SBATCH --ntasks-per-node=16
#SBATCH --mem-per-cpu=500m
#SBATCH --time=00:10:00
#SBATCH --account=ywuocean0
#SBATCH --partition=standard
#SBATCH --output=/scratch/yulinpan_root/yulinpan98/%u/WORKDIR/MITgcm/ECCOV4/release4/flux-forced/a.log


module purge
module load intel
module load impi
module load hdf5
module load netcdf-fortran
module list

set nprocs = 96
set basedir = scratch/yulinpan_root/yulinpan98/ziizen/WORKDIR/MITgcm/ECCOV4/release4/flux-forced
set inputdir = scratch/yulinpan_root/yulinpan98/ziizen/WORKDIR/MITgcm/ECCOV4/release4/flux-forced/forcing

endif
mkdir ${basedir}/run_trc
cd ${basedir}/run_trc
ln -s ${basedir}/namelist_offline_ptracer/* .

ln -s ${inputdir}/input_init/error_weight/data_error/* .
ln -s ${inputdir}/input_init/* .
rm -rf NAMELIST

ln -s ${inputdir}/other/flux-forced/forcing/* .
ln -s ${inputdir}/other/flux-forced/forcing_weekly/* .
ln -s ${inputdir}/other/flux-forced/mask/* .
ln -s ${inputdir}/other/flux-forced/state_weekly/* .
ln -s ${inputdir}/other/flux-forced/xx/* .

cp -p ../build_trc/mitgcmuv .

mpiexec -np ${nprocs} ./mitgcmuv > a.log



