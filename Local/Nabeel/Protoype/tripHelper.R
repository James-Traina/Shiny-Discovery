# Note: percent map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does
# not exactly match the order in which the maps package plots counties

#removing the min and max args, we will calculate that within the function
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
trips_map <- function(var, color, legend.title) {
  var = round(var, 0)
  
  # generate vector of fill colors for map
  colors <- colorRampPalette(c("white", "blue"))(5)
  
  p1 <- quantile(all_trips, .20)
  p2 <- quantile(all_trips, .40)
  p3 <- quantile(all_trips, .60)
  p4 <- quantile(all_trips, .80)
  
  fills <- c()
  for (trip in var) {
    if (trip < p1) {
      fills = append(fills, colors[1]) 
    } else if (p1 <= trip & trip < p2) {
      fills = append(fills, colors[2])
    } else if (p2 <= trip & trip < p3) {
      fills = append(fills, colors[3])
    } else if (p3 <= trip & trip < p4) {
      fills = append(fills, colors[4])
    }
    else {
      fills = append(fills, colors[5])
      
    }
  }

  
  map("county", fill = TRUE, col = fills,
      resolution = 0, lty = 0, projection = "polyconic",
      myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
      lty = 1, lwd = 1, projection = "polyconic",
      myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
  legend.text <- c(paste0(round(p1, 0), " or less trips (20th Percentile)"),
                   paste0(round(p1, 0), " - ", round(p2, 0), " trips (40th Percentile)" ),
                   paste0(round(p2, 0), " - ", round(p3, 0), " trips (60th Percentile)"),
                   paste0(round(p3, 0), " - ", round(p4, 0), " trips (80th Percentile)"),
                   paste0(round(p4, 0), " or more trips"))
  
  legend("bottomleft",
         legend = legend.text,
         fill = colors[c(1, 2, 3, 4, 5)],
         title = legend.title)
}
