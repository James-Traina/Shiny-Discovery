ggplot(data = broadband, aes(x=year, y=broadband)) + 
  geom_boxplot(aes(group = year))
