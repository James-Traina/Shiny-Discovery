# Note: percent map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does
# not exactly match the order in which the maps package plots counties

#removing the min and max args, we will calculate that within the function
trips_map <- function(var, color, legend.title) {
  
  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(5)
  rounds <- round(var, -1)
  
  p1 <- quantile(rounds, .20)
  p2 <- quantile(rounds, .40)
  p3 <- quantile(rounds, .60)
  p4 <- quantile(rounds, .80)
  
  fills <- c()
  for (trip in rounds) {
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
  legend.text <- c(paste0(p1, " or less trips"),
                   paste0(p1, " - ", p2, " trips"),
                   paste0(p2, " - ", p3, " trips"),
                   paste0(p3, " - ", p4, " trips"),
                   paste0(p4, " or more trips"))
  
  legend("bottomleft",
         legend = legend.text,
         fill = shades[c(1, 2, 3, 4, 5)],
         title = legend.title)
}
