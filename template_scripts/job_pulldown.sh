#!/bin/bash
#SBATCH --job-name=test_step2
#SBATCH --mem=64000
#SBATCH --time=4:00:00
#SBATCH --output=out_%x_%j.log
#SBATCH --error=err_%x_%j.log
#SBATCH --partition=gpu-short
#SBATCH --ntasks=8
#SBATCH --nodes=1
#SBATCH --gres=gpu:1

module load CUDA/11.7.0

MAXRAM=$(echo `ulimit -m` '/ 1024.0'|bc)
GPUMEM=`nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits|tail -1`
export XLA_PYTHON_CLIENT_MEM_FRACTION=`echo "scale=3;$MAXRAM / $GPUMEM"|bc`
export TF_FORCE_UNIFIED_MEMORY='1'

cd /path/to/script/directory
apptainer exec --nv -B$CUDA_ROOT/lib64:/usr/local/nvidia/lib64 -B/data1,/scratchdata /cm/shared/singularity_images/a/alphapulldown-0.30.7.simg /bin/bash /path/to/do_pulldown.sh
