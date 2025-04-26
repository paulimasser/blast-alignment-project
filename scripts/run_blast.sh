#!/bin/bash

# ============ configuracion ========
data_dir="data"

results_dir="results"
db_name="all_bacteria_db"
query="${data_dir}/Escheriachia coli.fasta"
merged_fasta="{data_dir}/all_bacteria.fasta"
output_xml="${results_dir}/ecoli_vs_all.xml"

#===== Paso1: Crear carpetas =====
mkdir -p "&results_dir"

# ===== Paso 2: unir todas las seciuencias en un solo archivo =====
cat ${data_dir}/*.fasta > "$merged_fasta"

# ===== Paso 3: Crear base de datos =====
makeblastdb -in "$merged_fasta" -dbtype nucl -out "$data_dir/$db_name"

#===== Paso 4: ejecutar Blast =====
blastn -query "$query" -db "$data_dir/$db_name" -out "$output_xml" -outfmt 5

