#!/bin/bash
/opt/conda/bin/create_individual_features.py   --fasta_paths=/path/to/protein_A.fasta,protein_B.fasta        --data_dir=/data1/databases/AlphaFold/current   --save_msa_files=True --output_dir=/path/to/output/      --use_precomputed_msas=False --skip_existing=True --max_template_date=2050-01-01
