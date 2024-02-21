#!/bin/bash
/opt/conda/bin/run_multimer_jobs.py \
--mode=pulldown \
--num_cycle=3 \
--num_predictions_per_model=1 \
--output_path=/path/to/output \
--data_dir=/data1/databases/AlphaFold/current \
--protein_lists=protein_A.txt,protein_B.txt \
--monomer_objects_dir=/path/to/monomer_objects
