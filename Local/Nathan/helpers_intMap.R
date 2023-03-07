int_map <- function(var, color, legend.title, min = 0, max = Inf) {
  
  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(100)
  
  # constrain variable to the range min-max
  var <- pmax(var, min)
  var <- pmin(var, max)
  
  # create breaks for the color ramp
  n <- min(max - min + 1, 5) # 5 or fewer breaks
  breaks <- seq(min, max, length.out = n)
  
  # use the color ramp to fill the counties
  #
  fills <- cut(var, breaks, include.lowest = TRUE)
  fills <- as.numeric(levels(fills))[fills]
  fills <- shades[fills]
  
  # plot the map
  map("county", fill = TRUE, col = fills, 
      resolution = 0, lty = 0, projection = "polyconic", 
      myborder = 0, mar = c(0,0,0,0))
  
  # add state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
      lty = 1, lwd = 1, projection = "polyconic", 
      myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
  legend.text <- c(paste0(min, " or fewer"),
                   breaks[-1],
                   paste0(max, " or more"))
  
  legend("bottomleft", 
         legend = legend.text, 
         fill = shades[seq(1, 101, length.out = n)],
         title = legend.title)
}


#documentation 
# C() is used to concatenate or combine objects (vectors, lists, matrices)
# cut() is a function that is used to divide a continuous variable into intervals. Helpful to group data into discrete bins.
# seq() is a built in function that generates a sequence of numbers. Arguments: from, to, by, length.out
# map() used to draw maps of various regions using data.
# legend.text is a vector of text labels that will be used as the legend labels for a plot.
# paste0() is a function in R that concatenates vectors after converting them to character vectors
