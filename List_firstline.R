# make list of first 3 fils

# list.ICC <- list(a1 = read.table( "/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P003_LP_3_80V_25_icc.dat",
#                  a2=read.table( "/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P004_MP_3_80V_25_icc.dat"),
#                  a3= read.table("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P005_UP_3_80V_25_icc.dat"))
m1 <-  read.table("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P003_LP_3_80V_25_icc.dat")
m2 <-  read.table( "/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P004_MP_3_80V_25_icc.dat")
m3 <-  read.table("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P005_UP_3_80V_25_icc.dat")

function(x, i){
  x <-read.table("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2")
  
}
 list.ICC <- list(m1,m2,m3)
 first.line <-function(x, i) {list.ICC[[i]][1:1,]
 }
 
 first.lines <- lapply(list.ICC,)
   
   list.ICC[[i]][1:1,]

str(list.ICC)
files <- (Sys.glob("B2.*"))


# to merge all files together
# multmerge_1line = function(mypath){
#   filenames=list.files(path=mypath, full.names=TRUE)
#   datalist = lapply(filenames, function(x){read.table(file=x,header=T)})
#   Reduce(function(x,y) {merge(x,y)}, datalist)
# }

setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlcB2")
require(plyr)
require(dostats)

files <- list.files(pattern = " *.dot")
files %>% str

for (i in seq_along(files)) {
  
  assign(paste("Df", i, sep = "$"), read.table(files[i]))
  
  assign(paste(paste("Df", i, sep = ""), "first_line", sep = "."), 
         ldply(get(paste("Df", i, sep = ".")), dostats, sum, min, mean, median, max))
  
}

list.1<-  lapply( list.ICC, first.lines(list.ICC[1:3][1]) )

list.ICC[[1]][1,]
list.ICC[[2]][1,]

list.NN <- list()

# sotavly list failof
filenames <- list.files("temp", pattern="*.dot", full.names=TRUE)
ldf <- lapply(filenames, read.lines("*.dot",n=1) )
res <- lapply(ldf, summary)
names(res) <- substr(filenames)

merge_flines = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){readLines(x, n=1)})
  
}
b2_firstlines <- merge_flines("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2")
b2_firstlines %>% str()
b2_firstlines %>% head
getFirst(b2_firstlines)

#b2_df <- data.frame(matrix(unlist(b2_firstlines), nrow=306, byrow=T),stringsAsFactors=FALSE)
b2_tb <- data.table(matrix(unlist(b2_firstlines), nrow=306, byrow=T),stringsAsFactors=FALSE)
b2_tb <- data.table(matrix(unlist( b2_firstlines ), nrow=306, byrow=T))
b2_tb %>% head
b2_tb %>% str

library(splitstackshape)
b2_df <- as.data.frame(b2_td)
b2_df %>% str
b2 <- strsplit(as.character(b2_tb$V1), ' ', fixed=TRUE)

b2_2<- data.table(matrix(unlist( b2 ), nrow=306, byrow=T))
b2_2 %>% str
b2_2
b2_2[[i]][i]



#-----------
  
library(BBmisc)
  merge_fel = function(mypath){
    filenames=list.files(path=mypath, full.names=FALSE)
    for i in mypath
    datafr <- apply(filenames, 1, rbind     )
  
  }
  b2_firstlines <- merge_fel("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2")
  b2_firstlines %>% str()
  b2_firstlines %>% head
  
  m1[1,1]
# b2 <- as.data.frame(b2, do.call(rbind, newColl))
# b2 %>% str
# 
# b2 <- cSplit(b2_tb, V1, " ")
# b2 <- separate (b2_tb, V1,  sep = " ")
# 
# b2
# b2 <- read.table( b2_tb$V1, sep =" ", colClasses ="character")
# 
# 
# b2 <- rbind(b2_df)
# b2 %>% str
# 
# library(reshape2)
# library(dplyr)
# b2 <- list(b2_firstlines)
# b2
# b2 <- melt(b2)
# b2 %>% str
# b2$L2 <- NULL
# b2$L1 <- NULL
# b2 <- data.frame(b2)
# b2 %>% head
# library(tidyr)
# b2 <- read.table( b2, sep =" ", col.names = V1,V1)
# 
# 
# 
# #dcast(b2, L1~. )
# 
# 
# b2 <- unlist(b2_firstlines)
# b2 <- as.data.frame(b2)
# b2 %>% str
# b2 <- rbind(b2_firstlines)
# b2 %>% head
# 
# b2 <- data.frame(Reduce(rbind, b2_firstlines))
# b2 (names)
# b2 <- colsplit(b2_firstlines, split=" _", names)
# b2 <- unlist(b2_firstlines, recursive = TRUE )
# b2 %>% head
