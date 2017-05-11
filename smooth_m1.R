## pp_program_MLC_B2_X2_D0_T001_B0000_P003_LP_3_80V_25_icc.dat

library(data.table) 
library(dplyr)
library(caret)
m1 <- read.table("pp_program_MLC_B2_X2_D0_T001_B0000_P003_LP_3_80V_25_icc.dat")
m1 %>% head
tail(m1)
m1 %>% dim()
m1 %>% summary()
hist_m1 <- hist.default(m1$V2, plot=TRUE, main = 'hist1' )
t1 <- gl(2626, 6)
tail(t1)
head(t1)
str(t1)
#tm1 <- cbind(m1, t1)
tm1 <- data.frame(m1, t1)
dim(tm1)
tm1 %>%  head(20)
tail(tm1, 20)
plot(tm1$t1, tm1$V2)
#1
colavg <- names(tm1)[1:2]
bymean <- tm1[ ,lapply(.SD,mean), by = "t1", .SDcols=calavg]
#2




#3
library(reshape2)
str(tm1)
t1 <- as.integer(t1)
bm1 <- melt(tm1, id = c("t1"))
bm1 %>% head
collapsing <- dcast(bm1, t1 ~ variable, mean)
collapsing %>% head 
tail(collapsing)
collapsing %>% dim
library(ggplot2)
pl1 <-ggplot(collapsing, aes(x=t1, y=V2, color = t1)) + geom_point()
pl1  <- pl1 + geom_line(alpha= 0.5, group = t1, linetype = 1)
pl1
##

am1 <- aggregate(x= tm1[, 2], 
                 by=list(tm1$t1), 
                 FUN = "mean")
am1 %>% str
pl <- ggplot(am1, aes(x = Group.1, y= x, color= 'red')) +geom_line()
pl

pl2 <- ggplot(am1, aes(x = Group.1, y= x, color= 'red')) +geom_step() + scale_color_continuous(low = "blue", hight= "red" )
pl2

pl3 <- ggplot(am1, aes(x = Group.1, y= x, color= 'red')) +geom_smooth(method = 'auto')
pl3



#3
tm1 %>%group_by(tm1$t1) %>% summarise_each(fun(mean()))
am1 %>%  head()
str(tm1)
am1<- t1(tm1)[2]
am1 <- aggregate(x= tm1[, 2], 
                 by=list(tm1$t1), 
                 FUN = "mean")

am1 %>% head(20)
am1  <- subset(am1, select =c(x, Group.1))
am1 %>% head(20)
dim(am1)
plot(am1)
plot(glimpse(am1$x, am1$Group.1), 
     main = "agregated MLC", 
     xlab = "time in groups of 10 sec", 
     ylab ="avarage of curent")   # give R-session terminated:warning!

am1 %>% dim

frequency(m1)
write.csv(m1, "m1.csv")
write.csv(am1, "am1.csv")

m2 <- read.table("/Users/38923/Desktop/Raw DataV - 1Z128GbX3/prog/mlc/pp_program_MLC_B2_X2_D0_T001_B0000_P004_LP_3_80V_25_icc.dat")
m2 %>% head
m2 %>% dim()
hist_m2 <- hist.default(m2$V2, plot=TRUE )
plot(m2)

m2 %>% summary()
hist_m2 <- hist.default(m2$V2, plot=TRUE, main = 'hist2' )
t1 <- gl(15756, 10)
tm2 <- data.frame(m2, t1)
tm2 %>%  head(20)
am2 <- aggregate(x= tm2$V2, 
                 by=list(tm2$t1), 
                 FUN = "mean")
am2 %>% head(20)
am2  <- subset(am2, select =c(x, Group.1))
am2 %>% head(20)
plot(glimpse(am2$x, am2$Group.1), 
     main = "agregated MLC2", 
     xlab = "time in groups of 10 sec", 
     ylab ="avarage of curent") 
frequency(am2)
write.csv(am2, "am2.csv")
