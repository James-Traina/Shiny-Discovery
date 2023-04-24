brands <- list.files("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Data/Brand/")
list_of_brands <- list()

for (i in brands) {
  list_of_brands[[i]] <- get(load(paste0("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Data/Brand/", i)))
}
brands <- list_of_brands



all_brands <- c()
for (i in brands) {
  if (i$panel_year[1] > 2005 & i$panel_year[1] < 2019) {
    all_brands <- c(all_brands, i$avg_brand) }
}
brands_map <- function(var, color, legend.title) {
  var = round(var, 0)
  
  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(5)
  
  p1 <- quantile(all_brands, .20)
  p2 <- quantile(all_stores, .40)
  p3 <- quantile(all_brands, .60)
  p4 <- quantile(all_brands, .80)
  
  fills <- c()
  for (b in var) {
    if (b < p1) {
      fills = append(fills, colors[1]) 
    } else if (p1 <= b & b < p2) {
      fills = append(fills, colors[2])
    } else if (p2 <= b & b < p3) {
      fills = append(fills, colors[3])
    } else if (p3 <= b & b < p4) {
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
         fill = shades[c(1, 2, 3, 4, 5)],
         title = legend.title)
}

