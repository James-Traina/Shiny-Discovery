#Goal is to convert percents to number of trips 
#I was able to manually find the minimum and maximum of each trip dataset without using for loops. 
#The minimum average trip number throughout all the years is 18 
#The maximum trip number throughout all the years is about 1098

# All we need to change is the minimum and maximum from broadband percents to average trip numbers here. 
# We set min equal to minimum average trip number and max equal to maximum average trip number 
trip_number <- function(var, color, legend.title, min = 18, max = 1098) {
  
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
  
  # I modified the legend to be in average number of trips rather than percents
  inc <- (max - min) / 4
  legend.text <- c(paste0(min, "trips or less"),
                   paste0(min + inc, " trips"),
                   paste0(min + 2 * inc, " trips"),
                   paste0(min + 3 * inc, " trips"),
                   paste0(max, "trips or more"))
  
  legend("bottomleft", 
         legend = legend.text, 
         fill = shades[c(18, 288, 558, 828, 1098)], 
         title = legend.title)
}
