#!/usr/bin/env bash
set -ex

source ./config.sh

if [ ! -d "${PDB_FOLDER}" ]; 
then
	echo "Missing input pdb folder!"
fi

if [ $json_count -eq 1 ];
then

	python3 /opt/CombFold/scripts/prepare_fastas.py ${JSON_FILE} --stage groups --output-fasta-folder ../results/fasta_groups --input-pairs-results ${PDB_FOLDER} --max-af-size ${max_af_size}

	jupyter nbconvert \
		--to 'html' \
		--ExecutePreprocessor.allow_errors=True \
		--ExecutePreprocessor.timeout=-1 \
		--FilesWriter.build_directory=../results \
		--execute make_figure.ipynb

else
	echo "This Capsule only works with 1 .json file at a time."
fi
