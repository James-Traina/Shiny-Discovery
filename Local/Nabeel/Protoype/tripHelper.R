# Note: percent map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does
# not exactly match the order in which the maps package plots counties

#removing the min and max args, we will calculate that within the function
trips_map <- function(var, color, legend.title) {
  
  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(100)
  
  # constrain gradient to percents that occur between min and max
  # minVal <- min(var)
  # maxVal <- max(var)
  # var <- pmax(var, minVal)
  # var <- pmin(var, maxVal)\\\
  print("shades")
  print(shades)
  print("var")
  print(var)
  fills <- shades[var]
  newFills <- replace(fills, is.na(fills), "orange")
  print(newFills)
  
  # plot choropleth map
  # map("county", fill = TRUE, col = fills,
  #   resolution = 0, lty = 0, projection = "polyconic",
  #   myborder = 0, mar = c(0,0,0,0))
  
  map("county", fill = TRUE, col = newFills,
      resolution = 0, lty = 0, projection = "polyconic",
      myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
      lty = 1, lwd = 1, projection = "polyconic",
      myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
  min <- 33
  max <- 789
  inc <- (max - min) / 4
  legend.text <- c(paste0(min, " % or less"),
                   paste0(min + inc, " %"),
                   paste0(min + 2 * inc, " %"),
                   paste0(min + 3 * inc, " %"),
                   paste0(max, " % or more"))
  
  legend("bottomleft",
         legend = legend.text,
         fill = shades[c(1, 25, 50, 75, 100)],
         title = legend.title)
}