library("dplyr")


  
#trips
broadband08 <- broadband[broadband$year %in% c("2008"),]
broadbandTrips <- merge(broadband08, trips$c_trips_2008.RData, by.x = "county", by.y = "cfips")

#
broadbandChains <- merge(broadband08, chains$c_store_2008.RData, by.x = "county", by.y = "cfips")


