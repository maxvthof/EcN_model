## EcN_model

Construction of EcN model iHM1533 based on 55 reference strains. The pipeline for comparison of EcN to the reference strains and construction of the draft model was based on the work of Norsigian et al. [1]. 

### 1. Model inspection
Notebook 1. Generation of panmodel and panreactome of all reference strains<br>

### 2. Genome comparison
Notebook 2.1 Comparison of EcN genome to reference genomes based on protein and DNA homology<br>
Notebook 2.2 Analysis of the genome comparison in 2.1<br>
Notebook 2.3 Visualisation of the genome comparison in a heatmap

### 3. Draft model reconstruction
Notebook 3.1 Generation of the draft model based on iML1515 with addition from other reference models, based on genome comparison (protein)<br>
Notebook 3.2 Addition of reactions based on DNA genome comparison (none found to be added)<br>
Notebook 3.3 Reactions added from EcN model iDK1463

### 4. Curation
Notebook 4.1 Correction of duplicate reactions and removal of unbound energy-generating fluxes<br>
Notebook 4.2 Correction of mass and charge balances, correction of incorrect formulas of metabolites<br>
Notebook 4.3 Use gapfilling to identify reactions missing for the metabolism of carbon sources<br>
Notebook 4.4 Use gapfilling to identify reactions correcting blocked reactions<br>
Notebook 4.5 Correct errors found during gene essentiality and biology analysis<br>
Notebook 4.6 Addition of secondary metabolite biosynthetic pathways<br>
Notebook 4.7 Update of reaction and metabolite annotation and removal of genes and metabolites not linked to reactions<br>
Notebook 4.8 Analysis of final model

### 5. Validation
Notebook 5.1 Comparison of iHM1533 and iDK1463 to biology data<br>
Notebook 5.2 Comparison of flux predictions of iHM1533 to 13C data<br>
Notebook 5.3 Gene essentiality analysis on M9 media<br>
Notebook 5.3b Gene essentiality analysis on Gut Microbiome Media (GMM)

### 6. Application
Notebook 6.1 FSEOF analysis of secondary metabolite biosynthesis pathways

### References
[1] Norsigian, C.J., Fang, X., Seif, Y. et al. A workflow for generating multi-strain genome-scale metabolic models of prokaryotes. Nat Protoc 15, 1–14 (2020). https://doi.org/10.1038/s41596-019-0254-3
