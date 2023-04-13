library(ggplot2)
years <- c(2006:2018)
averages <- c(176.166, 173.4604, 174.5831, 172.9164, 168.987, 173.2001, 167.7919,
              163.7684, 161.7133, 155.0277, 161.4032, 160.3225, 163.4159)
df <-data.frame(years, averages)

ggplot(data=df, aes(x=years, y=averages, group=1)) +
  geom_line()+
  ggtitle("Average Number of Trips per Year")+
  ylim(140,200)+
  geom_point(color="blue", size=3)







