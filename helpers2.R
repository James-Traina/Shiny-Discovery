# Note: percent map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does 
# not exactly match the order in which the maps package plots counties
trips <- list.files("Trips/")
list_of_trips <- list()
#Find the minimum trip number among all datasets
minimum <- min(list_of_trips[[0]]$avg_trips)
for (i in trips) {
  if (min(list_of_trips[[i]]$avg_trips) < minimum){
    minimum <- list_of_trips[[i]]$avg_trips
  }
}
#Find the maximum trip number among all datasets
maximum <- max(list_of_trips[[0]]$avg_trips)
for (i in trips) {
  if (max(list_of_trips[[i]]$avg_trips) > maximum){
    maximum <- list_of_trips[[i]]$avg_trips
  }
}
# All we need to change is the minimum and maximum from percents to actual numbers here. 
# We set min equal to minimum and max equal to maximum
trip_number <- function(var, color, legend.title, min = minimum, max = maximum) {
  
  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(100)
  
  # constrain gradient to trip numbers that occur between min and max
  var <- pmax(var, min)
  var <- pmin(var, max)
  trip_number <- as.integer(cut(var, 100, include.lowest = TRUE, ordered = TRUE))
  fills <- shades[trip_number]
  
  # plot choropleth map
  map("county", fill = TRUE, col = fills, 
      resolution = 0, lty = 0, projection = "polyconic", 
      myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
      lty = 1, lwd = 1, projection = "polyconic", 
      myborder = 0, mar = c(0,0,0,0))
  
  # add a legend. All we need to change is the increment for the number of trips. 
  # What should the increment for the number of trips be? I think the increment should be approximately 100
  # based on the min and max value of every dataset
  inc <- (max - min) / 7
  legend.text <- c(paste0(min, "trips or less"),
                   paste0(min + inc, " trips"),
                   paste0(min + 2 * inc, " trips"),
                   paste0(min + 3 * inc, " trips"),
                   paste0(min + 4 * inc, " trips"), 
                   paste0(min + 5 * inc, " trips"), 
                   paste0(min + 6 * inc, " trips"),
                   paste0(max, "trips or more"))
  
  legend("bottomleft", 
         legend = legend.text, 
         fill = shades[c(min, min+inc, min + 2 * inc, min + 3 * inc, min + 4 * inc, min + 5 * inc, min + 6 * inc, max)], 
         title = legend.title)
}

