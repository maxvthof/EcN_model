#set Working directory
#use session>set working directory

library(reshape2)
library(dplyr)
library (ggplot2)
library(ggthemes)
library (RColorBrewer)
library(forcats)

sec_mets <- list("Aerobactin", "Colibactin", "Enterobactin", "Salmochelin", "Yersiniabactin")

pdf(file = "../figures/high_slope_reactions_all_sec_met.pdf")
for (sec_met in sec_mets)
{
print(sec_met)

#make a dataframe per condition
X00 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.csv', sep=""))
X10 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.1.csv', sep=""))
X20 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.2.csv', sep=""))
X30 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.3.csv', sep=""))
X40 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.4.csv', sep=""))
X50 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.5.csv', sep=""))
X60 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.6.csv', sep=""))
X70 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.7.csv', sep=""))
X80 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.8.csv', sep=""))
X90 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_0.9.csv', sep=""))
X100 <- read.csv(paste('../tables/sec_met_fva/', sec_met, '/df_fva_sec_met_selected_1.csv', sep=""))

common_reactions_plot <- ggplot(data = X00, aes(x=ID, ymin = lb, ymax = ub, color='0%'))+
  # Add FVA line ranges
  geom_linerange(data = X100,size = 6, aes(color = '100%'))+
  geom_linerange(data = X90,size = 6, aes(color = '90%'))+
  geom_linerange(data = X80,size = 6, aes(color = '80%'))+
  geom_linerange(data = X70,size = 6, aes(color = '70%'))+
  geom_linerange(data = X60,size = 6, aes(color = '60%'))+
  geom_linerange(data = X50,size = 6, aes(color = '50%'))+
  geom_linerange(data = X40,size = 6, aes(color = '40%'))+
  geom_linerange(data = X30,size = 6, aes(color = '30%'))+
  geom_linerange(data = X20,size = 6, aes(color = '20%'))+
  geom_linerange(data = X10,size = 6, aes(color = '10%'))+
  geom_linerange(data = X00,size = 6, aes(color = '0%'))+
  # Add pFBA points
  geom_point(data=X100, aes(x=ID,y=pfba_sec_met, fill = '10'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X90, aes(x=ID,y=pfba_sec_met, fill = '9'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X80, aes(x=ID,y=pfba_sec_met, fill = '8'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X70, aes(x=ID,y=pfba_sec_met, fill = '7'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X60, aes(x=ID,y=pfba_sec_met, fill = '6'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X50, aes(x=ID,y=pfba_sec_met, fill = '5'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X40, aes(x=ID,y=pfba_sec_met, fill = '4'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X30, aes(x=ID,y=pfba_sec_met, fill = '3'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X20, aes(x=ID,y=pfba_sec_met, fill = '2'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X10, aes(x=ID,y=pfba_sec_met, fill = '1'), colour="grey", pch=22, size = 2.0)+
  geom_point(data=X00, aes(x=ID,y=pfba_sec_met, fill = '0'), colour="grey", pch=22, size = 2.0)+
  theme_bw()+
  ylab("Flux ranges and values across biomass constraints (0 to 100%)")+
  ggtitle(paste('FSEOF targets with maximum slopes:', sec_met))+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(expand = c(0, 0), breaks= seq(-1000,1000,by=100))+
  scale_colour_manual("", 
                      breaks = c("100%", "90%", "80%", "70%", "60%", "50%", "40%", "30%", "20%", "10%", "0%"),
                      values = c("100%"="#004c6d", "90%"="#006083", "80%"="#007599", "70%"="#008bad", "60%"="#00a1c1", "50%"="#00b8d3", "40%"="#00cfe3", "30%"="#00e7f2", "20%"="#00ffff", "10%"="#aeffff", "0%"="#dfffff"),
                      labels = c("100% FVA", "90% FVA", "80% FVA", "70% FVA", "60% FVA", "50% FVA", "40% FVA", "30% FVA", "20% FVA", "10% FVA", "0% FVA")) +
  scale_fill_manual("", 
                      breaks = c("10","9", "8", "7", "6", "5", "4", "3", "2", "1", "0"),
                      values = c("10"="#004c6d", "9"="#006083", "8"="#007599", "7"="#008bad", "6"="#00a1c1", "5"="#00b8d3", "4"="#00cfe3", "3"="#00e7f2", "2"="#00ffff", "1"="#aeffff", "0"="#dfffff"),
                      labels = c("100% pFBA","90% pFBA", "80% pFBA", "70% pFBA", "60% pFBA", "50% pFBA", "40% pFBA", "30% pFBA", "20% pFBA", "10% pFBA", "0% pFBA")) +
  theme(axis.text.x = element_text(angle = 90,hjust = 1, vjust=0.5))+
  aes(x = fct_inorder(ID))+
  xlab("Reactions identified as FSEOF targets")

print(common_reactions_plot)
}
dev.off()