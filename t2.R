setwd("/Users/38923/Desktop/R/WD_P1")

library(dplyr)
library(caret)


a<-mlc0$V1/10
a

mlc0 %>% group_by(2) %>% head(10)
a <-filter(mcl0, row_number()== n(5))

b<-createDataPartition(y=mlc0, time= 2 )
b
library(dplyr)
library(caret)
mlc0 <- read.table("/Users/38923/Documents/Raw Data/C4cache_program_MLC_X100000.dat")
mlc0 %>% head
summary(mlc0)
hist_mlc0 <- hist.default(mlc0$V2, plot=TRUE )
plot(mlc0)
pl1 <-plot(aggregate(mlc0,FUN=mean))
frequency(mlc0)
write.csv(mlc0, "mlc0.csv")

mlc1 <- read.table("/Users/38923/Documents/Raw Data/C4cache_program_MLC_X100001.dat")
mlc1 %>% head
summary(mlc1)
hist_mlc1 <- hist.default(mlc1$V2, plot=TRUE )
hist_mlc1
write.csv(mlc1, "mlc1.csv")

t1 <-  as.data.frame(mlc0, id = 1:4)
mlc0 %>% head
t1

library(Hmisc)

t1 <- gl(999998, 5)
mlc0_t <- data.frame(mlc0, t1)
mlc0_t %>%  head(20)

mlc0_t$t1 <- NULL
time1 <- group_by(mlc0_t, t1.1)
class(mlc0_t$t1.1)
str(mlc0_t)
plot.ts(mlc0_t)

decomp <-decompose(mlc0_t)
decomp
arrange(mlc0_t, t1.1)
aggr1 <- aggregate(mlc0_t, list(mlc0_t$t1.1), FUN = min)
aggr1 %>% head(20)

plot(aggr1)
library("readr")
library("tibble")



df <- list.files(pattern = ".csv")
df
str(df)
print(df)
glimpse(df)
rlist <- read_list(df, read_csv)
boxplot(mlc0~cycle(mlc0))

as.ts(mlc0)
library(tseries)
library(forecast)
