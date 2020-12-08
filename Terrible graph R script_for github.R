
library(readxl)
library(tidyverse)
library(ggplot2)

setwd("https://github.com/nmarkina/Plot")
df_graph <- read_excel("ANT_output.xlsx")

number_of_bar <- nrow(df_graph)
df_graph$angle <- 90 - 360*(df_graph$trial_num-0.5)/number_of_bar #calculate the angle of labels


ggplot(df_graph, aes(x = trial_num, y = rt)) + 
  coord_polar(start= 0, theta = "x", direction = 1)+
  geom_text(label = df_graph$flanker_location, angle = 15, vjust = -10, hjust = -5, alpha = 0.6, 
            size = 6, color = "pink") + 
  geom_text(label = df_graph$correct, angle = df_graph$angle, vjust = -10, hjust = 0, alpha = 0.3, 
            size = 4.5, color = ifelse(df_graph$correct == "true","orange", "red"))+
 geom_violin(fill="navy")+
  geom_path()+
  geom_area(fill="red")+
    theme_minimal()+
  theme(plot.title = element_text(color = "navy", size = 18), 
        axis.title = element_text(color = "red"))+
labs(title = "Effects of Merry Christmas on attention networks", y = "Reaction time, msec")+
  geom_text(label = df_graph$flanker_type, angle = df_graph$angle, vjust = 10, hjust = 0, alpha = 0.6, 
            size = 4.5, color = ifelse(df_graph$flanker_type == "incongruent",
             "red", ifelse(df_graph$flanker_type == "congruent","brown", "green")))+
  theme(panel.background = element_rect(fill = "skyblue"))

  




