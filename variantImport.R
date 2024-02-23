variantImport <- function(url, filename) {
  zipFileName <- paste0(filename, ".zip")
  download.file(url, zipFileName)
  unzip(zipFileName)
  data <- read.csv(filename)
  data <- data[grep("^Pahal", data$gene), ]
  data$begPos <- as.numeric(gsub("->.*","", data$pos))
  data$endPos <- as.numeric(gsub(".*->","", data$pos))
  data <- data[order(data$chrom, data$begPos, data$endPos), ]
  return(data)
}
source("variantImport.R",echo = T)
q1Url <- "https://utexas.box.com/shared/static/21vasb3e7b57az1ud8ccuqxlqo361cxn.zip"
q1Filename <- "phalliiFNP_Variants_scrambledSubset.csv"
varDf <- variantImport(url = q1Url,filename = q1Filename)
str(varDf,strict.width ="cut")
