RNA-seq Analysis of Plant Immune Response to Bacterial Effectors

Overview
This project analyzes RNA-seq data to study how gene expression changes in Arabidopsis thaliana during plant immune responses to bacterial infection. The analysis focuses on transcriptional responses induced by bacterial effector proteins AvrRpt2 and AvrRps4.

The main objective is to identify differentially expressed genes and visualize global transcriptomic changes during infection.

---
Dataset
- Source: Gene Expression Omnibus (GEO)
- Accession: GSE301887
- Data type: Raw RNA-seq gene count matrix
- Rows represent genes
- Columns represent individual plant samples

---

Experimental Design
- Organism: Arabidopsis thaliana
- Conditions:
  - Control
  - Mock-treated plants
  - Infection with AvrRpt2
  - Infection with AvrRps4
- Time points:
  - 6 hours
  - 12 hours
  - 20 hours
- Multiple biological replicates per condition

Sample metadata (condition, time point, replicate) was extracted from the column names of the count matrix.

---
 Analysis Workflow
1. Construction of sample metadata from column names
2. Differential expression analysis using DESeq2
3. Time-point specific comparisons (infected vs mock)
4. Principal Component Analysis (PCA) to assess global transcriptomic changes
5. Heatmap visualization of selected differentially expressed genes
6. Volcano plots for differential expression overview
7. Gene Ontology (GO) enrichment analysis for biological interpretation

---

Results Summary
- Infection induces clear and time-dependent changes in gene expression
- Mock and control samples show similar expression patterns
- Infected samples cluster separately from mock samples in PCA analysis
- Differentially expressed genes show coordinated regulation related to immune responses

---
Project Structure
-data/ 
-scripts/ 
-results/ 
-figures/ 
-README.md

---
 How to run
Open R or RStudio and run:

```r
setwd("C:/Users/melli/Desktop/transcriptomicsweek1")
source("scripts/01_analysis_pipeline.R")
---
Outputs
- Differential expression tables (CSV)
- PCA plots
- Heatmaps
- Volcano plots
- GO enrichment plots
