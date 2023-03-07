# Load packages ----
library(shiny)
library(maps)
library(mapproj)
library(haven)


# Load data ----
broadband <- read_dta("C:\\Users\\Nathaniel Chen\\Desktop\\Discovery_7MDE\\Prototype\\Datasets\\broadband_county_year.dta")
counties <- readRDS("C:\\Users\\Nathaniel Chen\\Desktop\\Discovery_7MDE\\Prototype\\Datasets\\counties.rds")
trips <- list.files("C:\\Users\\Nathaniel Chen\\Desktop\\Discovery_7MDE\\Prototype\\Datasets\\Trips\\")
list_of_trips <- list()

for (i in trips) {
  print(i)
  list_of_trips[[i]] <- get(load(paste0("C:\\Users\\Nathaniel Chen\\Desktop\\Discovery_7MDE\\Prototype\\Datasets\\Trips\\", i)))
}
trips <- list_of_trips
#list_of_trips 1 is 2004
#list of trips 16 is 2019
# 2006 to 2018 is [5] to [15]



# Source helper functions -----
source( "C:\\Users\\Nathaniel Chen\\Desktop\\Discovery_7MDE\\Prototype\\helpers_intMap.R")


# User interface ----
ui <- fluidPage(
  titlePanel("Broadband Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Visualize broadband by county"),
      
      selectInput("displayvVar", label = "Choose a Variable to Display",
                  choices = c("Trips", "Broadband"), selected = "Broadband"),
      
      sliderInput("yearSlider",
                  label = "year:",
                  min = 2004, max = 2019, value = 2006,
                  step = 1, round = TRUE, ticks = TRUE),
      
      sliderInput("range", 
                  label = "Avg # of trips",
                  min = 0, max = 500, value = c(0,100))
    ),
    
    mainPanel(
      plotOutput("map")
    )
  )
)



# Server logic ----
server <- function(input, output) {
  # observeEvent(input$slider1, {
  #   print(paste0("You have chosen: ", input$slider1 - 2005))
  # })
  output$map <- renderPlot({
    broadband <- switch(input$yearSlider - 2004, 
                        "2004" = trips[1]$c_trips_2004.RData$avg_trips,
                        "2005" = trips[2]$c_trips_2005.RData$avg_trips,
                        "2006" = trips[3]$c_trips_2006.RData$avg_trips,
                        "2007" = trips[4]$c_trips_2007.RData$avg_trips,
                        "2008" = trips[5]$c_trips_2008.RData$avg_trips,
                        "2009" = trips[6]$c_trips_2009.RData$avg_trips,
                        "2010" = trips[7]$c_trips_2010.RData$avg_trips,
                        "2011" = trips[8]$c_trips_2011.RData$avg_trips,
                        "2012" = trips[9]$c_trips_2012.RData$avg_trips,
                        "2013" = trips[10]$c_trips_2013.RData$avg_trips,
                        "2014" = trips[11]$c_trips_2014.RData$avg_trips,
                        "2015" = trips[12]$c_trips_2015.RData$avg_trips,
                        "2016" = trips[13]$c_trips_2016.RData$avg_trips,
                        "2017" = trips[14]$c_trips_2017.RData$avg_trips,
                        "2018" = trips[15]$c_trips_2018.RData$avg_trips,
                        "2019" = trips[16]$c_trips_2019.RData$avg_trips
                        )
    
    
    color <- switch(input$yearSlider - 2004, 
                    "2006" = "red",
                    "2007" = "orange",
                    "2008" = "darkorange",
                    "2009" = "yellow",
                    "2010" = "lightgreen",
                    "2011" = "green",
                    "2012" = "darkgreen",
                    "2013" = "lightblue",
                    "2014" = "blue",
                    "2015" = "darkblue",
                    "2016" = "purple",
                    "2017" = "darkviolet",
                    "2018" = "pink",
    )
    
    legend <- switch(input$yearSlider - 2004, 
                     "2006" = "% of county with broadband in 2006",
                     "2007" = "% of county with broadband in 2007",
                     "2008" = "% of county with broadband in 2008",
                     "2009" = "% of county with broadband in 2009",
                     "2010" = "% of county with broadband in 2010",
                     "2011" = "% of county with broadband in 2011",
                     "2012" = "% of county with broadband in 2012",
                     "2013" = "% of county with broadband in 2013",
                     "2014" = "% of county with broadband in 2014",
                     "2015" = "% of county with broadband in 2015",
                     "2016" = "% of county with broadband in 2016",
                     "2017" = "% of county with broadband in 2017",
                     "2018" = "% of county with broadband in 2018",
    )
    
    int_map(trips, color, legend, input$range[1], input$range[2])
  })
  output$value <- renderPrint({input$slider1})
}

# Run app ----
shinyApp(ui, server)
         