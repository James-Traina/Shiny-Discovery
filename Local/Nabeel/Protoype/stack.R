trips <- list.files("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Data/Trips/")
list_of_trips <- list()

for (i in trips) {
  list_of_trips[[i]] <- get(load(paste0("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Data/Trips/", i)))
}
trips <- list_of_trips

all_trips <- c()
for (i in trips) {
  if (i$panel_year[1] > 2005 & i$panel_year[1] < 2019) {
    all_trips <- c(all_trips, i$avg_trips) }
}
