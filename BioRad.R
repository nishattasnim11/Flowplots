#packages
library("ggplot2")
library ("ggpubr")

##Import dataset
###test with flow rate of 0
Biorad_0 <- read.csv("~/Desktop/Biorad_0.csv")
###setting time and flow rate as factors
Biorad_0$Time<-as.factor(Biorad_0$Time)
Biorad_0$Flow.rate<-as.factor(Biorad_0$Flow.rate)

#actual with all flow rates for Biotin Samples
Biorad_all <- read.csv("~/Desktop/Biorad_all.csv")
Biorad_all$Time<-as.factor(Biorad_all$Time)
Biorad_all$Flow.rate<-as.factor(Biorad_all$Flow.rate)
summary(Biorad_all)

##time as category
Biorad_all_TimesT <- read.csv("~/Downloads/Biorad_all_TimesT.csv")
Biorad_all_TimesT$Time<-as.factor(Biorad_all_TimesT)
Biorad_all_TimesT$Flow.rate<-as.factor(Biorad_all_TimesT$Flow.rate)
summary(Biorad_all_TimesT)

##time as categy minus flow rate 0 or static
Nostatic<-Biorad_all_TimesT[-c(1:36),,drop=F]

##check
summary(Biorad_0)

##ggplot
flow0<-ggplot(data = Biorad_0, aes(x=Biorad_0$Time, y=Biorad_0$Peak, fill=Biorad_0$Flow.rate))+
  geom_boxplot(alpha=0.25)+
  scale_fill_viridis_d(option = "D")+
  geom_point( shape = 21,size=2, position = position_jitterdodge(), color="black",alpha=1)+
  xlab("Time (min)")+ ylab(expression(paste("Peak Current (",mu,"A)")))+
  labs(fill= (expression(paste("Flow rate (",mu,"l/s)"))))+
  theme(legend.position = "right")
  theme_pubr()

print(flow0)

##actual plot for Biotin data
flow1<-ggplot(data = Biorad_all, aes(x=Biorad_all$Time, y=Biorad_all$Peak, fill=Biorad_all$Flow.rate))+
  geom_boxplot(alpha=0.25)+
  scale_fill_viridis_d(option = "D")+
  geom_point( shape = 21,size=2, position = position_jitterdodge(), color="black",alpha=1)+
  xlab("Time (min)")+ ylab(expression(paste("Peak Current (",mu,"A)")))+
  labs(fill= (expression(paste("Flow rate (",mu,"l/s)"))))+
  theme(legend.position = "right")+ theme_pubr()
print(flow1)

##use facet wrap to make it less busy -- but still looks weird but good if you want to compare between flows
flow2<-ggplot(data=Biorad_all, aes(x=Biorad_all$Time, y=Biorad_all$Peak, fill=Biorad_all$Flow.rate))+
  geom_boxplot(alpha=0.25)

flow2<-flow2+facet_grid(.~Biorad_all$Flow.rate)+
  scale_fill_viridis_d(option = "D")+
  xlab("Time (min)")+ ylab(expression(paste("Peak Current (",mu,"A)")))+
  labs(fill= (expression(paste("Flow rate (",mu,"l/s)"))))+
  theme(legend.position = "right")+ 
  theme_pubr()

print(flow2)  

##used facet wrap with time categories T1-T4. Keep this for comparing with static
flow3<-ggplot(data=Biorad_all_TimesT, aes(x=Biorad_all_TimesT$Time, y=Biorad_all_TimesT$Peak, fill=Biorad_all_TimesT$Flow.rate))+
  geom_boxplot(alpha=0.25)+
  scale_fill_viridis_d(option = "D")+
  xlab ("Time")+
  ylab(expression(paste("Peak Current (",mu,"A)")))+
  labs(fill= (expression(paste("Flow rate (",mu,"l/s)"))))+
  theme(legend.position = "right")+ 
  theme_pubr()
print(flow3) 
flow4<-flow3+facet_grid(.~Biorad_all_TimesT$Flow.rate)
print(flow4)

##Plot minus static. Use instead of Flow 3 plot
flow5<-ggplot(data=Nostatic, aes(x=Nostatic$Time, y=Nostatic$Peak, fill=Nostatic$Flow.rate))+
  geom_boxplot(alpha=0.25)+
  scale_fill_viridis_d(option = "D")+
  xlab ("Time")+
  ylab(expression(paste("Peak Current (",mu,"A)")))+
  labs(fill= (expression(paste("Flow rate (",mu,"l/s)"))))+
  theme(legend.position = "right")+ 
  theme_pubr()
print(flow5)


  
