# work with file #3

library(data.table) 
library(dplyr)
library(caret)
m3 <-  read.table("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P005_UP_3_80V_25_icc.dat")
m3 %>% head
tail(m3)
m3 %>% dim()
m3 %>% summary()
hist_m3 <- hist.default(m3$V2, plot=TRUE, main = 'hist3' )

#cx <- cumsum(m3$V2)
#cx

# library(RcppRoll)
# ma <- roll_mean(m3$V2, weights = 20, by=20,
#            align = c("center"))
# ma %>% head
# str(ma)
# tm3 <- data.frame(m3, ma)
# tm3 %>% head

#var2 rolling max
# maxav <- roll_max(m3$V2, weights = 20, by = 1, fill = numeric(1),
#          partial = FALSE, align = c("center"), normalize = TRUE,
#          na.rm = FALSE)
# maxav
# m3$V2[1:20]
# tm3 <- data.frame(m3, maxav)
# tm3 %>% head

# my fun to get rolling ave
ma <- function(arr, n=20){
  res = arr
  for(i in n:length(arr)){
    res[i] = mean(arr[(i-n+1):i])
  }
  res
}
mean(m3$V2[1:20])
m3$V2[1:20]
ma
maf <-ma(m3$V2, 20)
maf %>% head

----------------------------------------------
#var4
library(ggplot)
library(plotly)
library(zoo)
m_a3<-rollmean(m3$V2, 100) # rolling mean per microsec us
t <-rollmean(m3$V1, 100)  # timing
t <- as.data.frame(t)
m3 %>% head   # head of the file m3
m_a3 %>% head # head of means in rolling procidure
t %>% head

hist.default(m3$V2, plot = TRUE)
hist.default(m_a3, plot = TRUE, main= "witn MA")
m_a3 %>% summary
dim(m_a3)
m_a3 <- as.data.frame(m_a3)
n.m3 <- cbind(t, m_a3)
n.m3 %>% head
plm <- ggplot(m3, aes(x = V1, y=V2 )) + 
  geom_line(aes( alpha = 0.4,color = 5), title(main = "Plot of all TLC"))
plm
#after avaraging
pl <- ggplot(n.m3, aes(x = t, y=m_a3 , color= 'red')) +geom_line()
pl

pl2 <- ggplot(n.m3, aes(x = t, y = m_a3)) +geom_density(aes(fill = t), alpha = 0.5) + ggtitle("Kernel Density estimates")
#position = "identity")
pl2 <- pl + geom_density()
pl2
pl_3 <- ggplot(m3, aes(x = V1, y= V2, color= 'red')) +geom_smooth()

pl_3
pl_a3 <- ggplot(n.m3, aes(x = t, y= m_a3, color= 'red')) +geom_smooth(method = 'auto')
pl_a3

