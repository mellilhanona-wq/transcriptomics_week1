# RNA-seq analysis of plant immune response (GSE301887)
# Differential expression and functional analysis

suppressPackageStartupMessages({
  library(DESeq2)
  library(clusterProfiler)
  library(org.At.tair.db)
})

dir.create("results", showWarnings = FALSE)
dir.create("figures", showWarnings = FALSE)
dir.create("results/deseq_timepoint", recursive = TRUE, showWarnings = FALSE)
dir.create("figures/PCA_timepoint", recursive = TRUE, showWarnings = FALSE)
dir.create("figures/GO", showWarnings = FALSE)

counts <- read.table(
  "data/GSE301887_flood.raw.counts.txt",
  header = TRUE,
  sep = "\t",
  row.names = 1,
  check.names = FALSE
)

samples <- colnames(counts)

condition <- ifelse(grepl("^control", samples), "control",
             ifelse(grepl("^Mock", samples), "Mock",
             ifelse(grepl("^AvrRpt2", samples), "AvrRpt2",
             ifelse(grepl("^AvrRps4", samples), "AvrRps4", NA))))

time <- ifelse(grepl("6h", samples), "6h",
        ifelse(grepl("12h", samples), "12h",
        ifelse(grepl("20h", samples), "20h", NA)))

replicate <- sub(".*[_-]([0-9]+)$", "\\1", samples)

coldata <- data.frame(
  condition = factor(condition),
  time = factor(time, levels = c("6h","12h","20h")),
  replicate = factor(replicate),
  row.names = samples
)

write.csv(coldata, "results/sample_metadata.csv")
