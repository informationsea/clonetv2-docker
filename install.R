options(repos="http://cran.rstudio.com/")

if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
# BiocManager::install("BSgenome")
# BiocManager::install("BSgenome.Hsapiens.UCSC.hg19")
# BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")
# BiocManager::install("BSgenome.Hsapiens.NCBI.GRCh38")
# BiocManager::install("GenomeInfoDb")

install.packages(c(
    "xlsx", "RSQLite", "tidyverse", "CLONETv2", "languageserver",
    "jsonlite", "ape", "memuse", "pinfsc50", "vegan", "vcfR"
))
