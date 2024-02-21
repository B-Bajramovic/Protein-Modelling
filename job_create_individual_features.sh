#!/bin/bash
#SBATCH --job-name=test
#SBATCH --mem=64000
#SBATCH --time=10:00:00
#SBATCH --output=out_indi_%x_%j.log
#SBATCH --error=err_indi_%x_%j.log
#SBATCH --partition=cpu-medium
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=8
#SBATCH --nodes=1
unset PYTHONPATH
apptainer exec  -B /data1,/scratchdata /cm/shared/singularity_images/a/alphapulldown-0.30.7.simg /path/to/do_individual_features.sh
