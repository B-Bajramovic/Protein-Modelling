#!/bin/bash
#SBATCH --job-name=fold
#SBATCH --nodes=1
#SBATCH --mem=64000
#SBATCH --time=04:00:00
#SBATCH --output=output_%x_%j.log
#SBATCH --error=error_%x_%j.log
#SBATCH --partition=gpu-short
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=8
#SBATCH --gres=gpu:1

module load ALICE

module load AlphaFold

module load CUDA/11.7.0

MAXRAM=$(echo `ulimit -m` '/ 1024.0'|bc)
GPUMEM=`nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits|tail -1`
export XLA_PYTHON_CLIENT_MEM_FRACTION=`echo "scale=3;$MAXRAM / $GPUMEM"|bc`
export TF_FORCE_UNIFIED_MEMORY='1'

run_alphafold.py \
--fasta_paths=/path/to/fasta \
--max_template_date=2025-05-14 \
--model_preset=monomer --db_preset=full_dbs \
--data_dir=/data1/databases/AlphaFold/current \
--output_dir=/path/to/output

