#set Working directory
#use session>set working directory

library(reshape2)
library(dplyr)
library (ggplot2)
library(ggthemes)
library (RColorBrewer)
library(forcats)


#read data
#data <- read.csv('Summary table.csv')

#make a dataframe per condition
X95 <- read.csv('flux_pred_0.95.csv')
X96 <- read.csv('flux_pred_0.96.csv')
X97 <- read.csv('flux_pred_0.97.csv')
X98 <- read.csv('flux_pred_0.98.csv')
X99 <- read.csv('flux_pred_0.99.csv')
X90 <- read.csv('flux_pred_0.9.csv')


#plot with model IDS
ggplot(data = X99, aes(x=model_id, ymin = silico_LB, ymax = silico_UB))+
  geom_linerange(data = X90,size = 6, aes(color = '90%'))+
  geom_linerange(data = X95,size = 6, aes(color = '95%'))+
  geom_linerange(data = X96,size = 6, aes(color = '96%'))+
  geom_linerange(data = X97,size = 6, aes(color = '97%'))+
  geom_linerange(data = X98,size = 6, aes(color = '98%'))+
  geom_linerange(data = X99,size = 6, aes(color = '99%'))+
  geom_pointrange(data=X99, aes(x= model_id, y = abs(Flux_x), ymin=abs(LB),ymax=abs(UB)), color = 'black', size = 0.7)+
  theme_bw()+
  ylab("Normalized Flux (%)")+
  ggtitle('Glucose')+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(expand = c(0, 0),limits = c(-20,50), breaks= seq(-20,50,by=10))+
  scale_colour_manual("", 
                      breaks = c("90%", "95%", "96%", "97%","98%", "99%", "Measured"),
                      values = c("#BCE8FF", "#9ED2F0","#80BDE1", "#61A8D2", "#3F93C3","#007FB5",'black'),
                      labs('FVA threshold'))+
  theme(axis.text.x = element_text(angle = 90,hjust = 1, vjust=0.5))+
  aes(x = fct_inorder(model_id))+
  xlab("")

#now I want to add the pFBA data to this plot aswell

#import pFBA
pfba <- read.csv('flux_pred_pfba.csv')
#remove unneeded columns
pfba = subset(pfba, select = c(model_id, pfba) )

#merge the pfba dataframe with the X99 to be able to plot it later?
X99 <- merge(x = X99, y = pfba, by = c("model_id"),all = TRUE)

#now try to plot with fixed fluxes now
ggplot(data = X99, aes(x=model_id, ymin = silico_LB, ymax = silico_UB))+
  geom_hline(yintercept=0)+
  geom_linerange(data = X90,size = 4, aes(color = '90%'))+
  geom_linerange(data = X95,size = 4, aes(color = '95%'))+
  geom_linerange(data = X96,size = 4, aes(color = '96%'))+
  geom_linerange(data = X97,size = 4, aes(color = '97%'))+
  geom_linerange(data = X98,size = 4, aes(color = '98%'))+
  geom_linerange(data = X99,size = 4, aes(color = '99%'))+
  geom_point(data=X99, aes(x=model_id,y=abs(pfba), color = 'pFBA'), size = 2.0, color = 'grey', shape = 15)+
  geom_point(data=X99, aes(x=model_id,y=abs(pfba)), size = 2.0, color = 'black', shape = 0)+
  geom_pointrange(data=X99, aes(x= model_id, y = abs(Flux_x), ymin=abs(LB),ymax=abs(UB), color = "Measured"), color = 'black', size = 1.0, fatten = 2)+
  theme_bw()+
  ylab("Normalized Flux (%)")+
  ggtitle('Glucose')+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(limits = c(-20,50), breaks= seq(-20,50,by=10))+
  scale_colour_manual("", 
                      breaks = c("90%", "95%", "96%", "97%","98%", "99%", "pFBA", "Measured"),
                      values = c("#BCE8FF", "#9ED2F0","#80BDE1", "#61A8D2", "#3F93C3","#007FB5", 'grey' ,'black'),
                      labels = c("90% FVA", "95% FVA", "96% FVA", "97% FVA", "98% FVA", "99% FVA", "pFBA", "Measured")) +
  theme(axis.text.x = element_text(angle = 90,hjust = 1, vjust=0.5))+
  aes(x = fct_inorder(model_id))+
  xlab("")+
  theme(legend.position = "none")
 
