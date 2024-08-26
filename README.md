[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Combinatorial Assembly in CombFold

This is the second CombFold capsule and third in the pipeline that includes ColabFold.  The pipeline predicts the structure of large protein complexes starting from the sequences of chains in the complex (up to at least 18,000 amino acids and 32 subunits). The pipeline uses AlphaFold-Multimer or ColabFold ("Streamlit ColabFold: AlphaFold2 using MMseqs2" capsule) to predict structures of possible subcomplexes which are combinations of subunits from the target complex. The CombFold Combinatorial Assembly algorithm assembles those structures into a single large complex.

The pipeline has 3 stages:

1. Defining subunits in the complex and generating output fasta files ("CombFold- prepare fasta" capsule)
2. Predicting structures using AlphaFold-Multimer or "Streamlit ColabFold: AlphaFold2 using MMseqs2" capsule for larger groups of subunits 
3. Running the Combinatorial Assembly algorithm on all generated structures. (this capsule)

In addition to viewing the output PDB files from this capsule in make_figure.ipynb, output PDB files can be saved as a data asset and viewed in the interactive "Mol* Viewer for PDB Files" capsule. 

## Input

- A json file that defines the protein complex.  Naively, each subunit should simply be a complete chain in the complex. In case a chain is long, it is required to cut it into several subunits. This can be done either naively, by dividing the chain into same-length subunits, or by using predictors for functional domains based on sequence. Another option is to predict disordered regions based on sequence(for example using IUPred3) and remove them and split the sequence on these regions.

It must have the following 4 fields:

1. name: a unique name for the subunit
2. sequence: the amino acid sequence of the subunit
3. chain_names: a list of chain names representing also the stoichiometry of the subunit
4. start_res: the index of the start residue of the sequence on the chain. Needed to set constraints on other subunits on the same chains.

For example:

```
{
  "name": "AD1",
  "chain_names": ["A", "B"],
  "start_res": 20,
  "sequence": "LTAAAQALDGLGDKFGRSIVDGNAILADVNPRMPQIRRDITGLANLGEVY"
}
```

which defines a subunit named AD1 with 50 amino acids (the sequence length) and that has 2 copies in the complex (chains labeled A and B).

- A folder of PDB files which are predicted by ColabFold or AlphaFold-Multimer models for different combinations of these subunits.

## Output

- **/fasta_groups**: a folder with files for each group of subunits in fasta format.

- **/assembled**: the models in cif or pdb format and model confidence for each

- **/tmp_assembled**
  - **/_unified_representation**
    - **/assembly_output**: pdb files and run logging information
    - **/transformations**
  - **/assembled_results**: : the models in cif or pdb format and model confidence for each


- **make_figure.html**: The Jupyter notebook with output, including the visualization of the protein. 


## App Panel Parameters

Input json file
- Input json containing protein subunit sequences. [Defalut: ../data/subunits.json]

Input folder with PDB files
- Folder containing predicted structures (.pdb files) for pairs of subunits. [Default: ../data/pdbs]

Maximum number of residues
- maximum number of residues that can be predicted using your prediction environment [Default: 1800]
- CombFold has a maximum of up to at least 18,000 amino acids and 32 subunits

Output file format
- pdb or cif [Default: pdb]

Maximum number of complexes to assemble 
- Maximum number of possible complexes generated [Default: 5]

Number of the model to display 
- Model to display in make_figure.html. 0 corresponds to the first model [Default: 0]


## Cite

Ben Shor, Dina Schneidman-Duhovny. "Predicting structures of large protein assemblies using combinatorial assembly algorithm and AlphaFold2."
https://www.biorxiv.org/content/10.1101/2023.05.16.541003v1

## Source

https://github.com/dina-lab3D/CombFold

Capsule adapted from https://codeocean.com/capsule/8791899/tree/v1

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)