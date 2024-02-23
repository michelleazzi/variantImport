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
