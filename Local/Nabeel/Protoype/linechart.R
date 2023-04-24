library(ggplot2)
years <- c(2006:2018)


#2006 to 2018
#2006
p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .10)
p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .10)
p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .10)
p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .10)
p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .10)
p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .10)
p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .10)
p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .10)
p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .10)
p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .10)
p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .10)
p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .10)
p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .10)
p10 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
         p2014, p2015, p2016, p2017, p2018)

p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .25)
p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .25)
p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .25)
p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .25)
p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .25)
p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .25)
p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .25)
p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .25)
p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .25)
p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .25)
p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .25)
p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .25)
p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .25)
p25 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
         p2014, p2015, p2016, p2017, p2018)

p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .50)
p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .50)
p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .50)
p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .50)
p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .50)
p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .50)
p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .50)
p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .50)
p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .50)
p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .50)
p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .50)
p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .50)
p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .50)
p50 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
         p2014, p2015, p2016, p2017, p2018)

p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .75)
p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .75)
p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .75)
p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .75)
p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .75)
p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .75)
p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .75)
p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .75)
p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .75)
p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .75)
p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .75)
p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .75)
p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .75)
p75 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
         p2014, p2015, p2016, p2017, p2018)

p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .90)
p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .90)
p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .90)
p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .90)
p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .90)
p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .90)
p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .90)
p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .90)
p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .90)
p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .90)
p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .90)
p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .90)
p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .90)
p90 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
         p2014, p2015, p2016, p2017, p2018)

df <- data.frame(years, p10, p25, p50, p75, p90)


ggplot(data=df, aes(x=years, y=p10)) +
  geom_line()+
  ggtitle("Average Number of Trips per Year")+
  ylim(140,200)+
  geom_point(color="blue", size=3)

  

ggplot(df, aes(x=years)) + 
  geom_line(aes(y = p10, color = "p10", group = 1L)) +
  geom_line(aes(y = p25, color = "p25", group = 1L)) +
  geom_line(aes(y = p50, color = "p50", group = 1L)) +
  geom_line(aes(y = p75, color = "p75", group = 1L)) +
  geom_line(aes(y = p90, color = "p90", group = 1L)) +
  aes(color = 1L) +
  ggtitle("Time Trends in Trips") +
  ylab("Average Number of Trips")

# geom_line(aes(y = p25), color="lightblue", linetype="dotdash") +
# geom_line(aes(y = p50), color="steelblue", linetype="F1") +
# geom_line(aes(y = p75), color="blue", linetype="dashed") +
# geom_line(aes(y = p90), color="darkblue", linetype="solid") +







