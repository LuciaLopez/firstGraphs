library(tidyverse)
library(ggthemes)
library(gridExtra)

setwd("C:/Users/Lucia/Downloads")
college <- read.csv("../Downloads/College.csv")

#My three first graphs
g1 <- college %>% ggplot(aes(X, y=Accept/10^4,label=substr(Private, 1,1))) +
  geom_bar(stat="identity", fill="deepskyblue4") +
  geom_text(nudge_y = 0.05, size = 2) +
  xlab("College") + ylab("Accept") +
  ggtitle("My first fabulous graph in R") + theme_gdocs() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1,size=6))

g2 <- college %>% ggplot(aes(X, y=Accept/10^4)) +
  geom_abline(lty = 2) +
  xlab("College") + ylab("Accept") +
  ggtitle("My second fabulous graph in R") + theme_gdocs()

params <- college %>% summarize(mean=mean(Books), sd=sd(Books))
g3 <- college %>% ggplot(aes(sample=Books)) +
  geom_qq(dparams = params, col = "springgreen4") +
  geom_abline(lty=3, col = "deepskyblue4") +
  ggtitle("My third fabulous graph in R") + theme_gdocs()

g4 <- college %>% ggplot(aes(sample=Books)) +
  geom_qq(dparams = params, col = "springgreen4") +
  geom_abline(lty=3, col = "deepskyblue4") +
  ggtitle("My 4 fabulous graph in R")

g1
g2
g3
g4

grid.arrange(g1, g2, g3, ncol=2)
