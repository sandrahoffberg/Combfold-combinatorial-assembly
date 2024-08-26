#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
    echo "args:"
    for i in $*; do 
        echo $i 
    done
    echo ""
fi


if [ -z ${1} ]; then
    JSON_FILE=$(find -L ../data -name "*.json")
else
    JSON_FILE=${1}
fi
export JSON_FILE

PATH_TO_JSON=$(dirname ${JSON_FILE})
export PATH_TO_JSON

json_count=$(echo $JSON_FILE | wc -w)

if [ -z ${2} ]; then
    pdb_file=$(find -L ../data -name "*.pdb" | head -n 1)
    PDB_FOLDER=$(dirname ${pdb_file})
else
    PDB_FOLDER=${2}
fi
export PDB_FOLDER

if [ -z ${3} ]; then
    max_af_size=1800
else
    max_af_size=${3}
fi

if [ ${4} == "cif" ]; then
    CREATE_CIF=True
else
    CREATE_CIF=False
fi
export CREATE_CIF

if [ -z ${5} ]; then
    MAX_COMPLEXES=5
else
    MAX_COMPLEXES=${5}
fi
export MAX_COMPLEXES

if [ -z ${6} ]; then
    MODEL=0
else
    MODEL=${6}
fi
export MODEL
