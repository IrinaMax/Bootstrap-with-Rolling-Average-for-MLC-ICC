
## moving average with window 20 for 1msec
ma <- function(arr, n=20){
  res = arr
  for(i in n:length(arr)){
    res[i] = mean(arr[(i-n+1):i])
  }
  res
}
arr <- list.ICC
ma

setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2")
require(plyr)
require(dostats)

files <- list.files(pattern = " *.dot")


for (i in seq_along(files)) {
  
  assign(paste("Df", i, sep = "$"), read.table(files[i]))
  
  assign(paste(paste("Df", i, sep = ""), "first_line", sep = "."), 
         ldply(get(paste("Df", i, sep = ".")), dostats, sum, min, mean, median, max))
  
}

list.1<-  lapply(read.table(" *.dot", n=1) )


list.NN <- list()
