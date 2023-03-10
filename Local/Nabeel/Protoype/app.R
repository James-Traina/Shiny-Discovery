# Load packages ----
library(shiny)
library(maps)
library(mapproj)
library(haven)


# Load data ----
broadband <- read_dta("/Users/nabeelqureshi/Downloads/broadband_county_year.dta")
counties <- readRDS("/Users/nabeelqureshi/App-1/census-app/counties.rds")
trips <- list.files("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Data/Trips/")
list_of_trips <- list()

for (i in trips) {
  list_of_trips[[i]] <- get(load(paste0("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Data/Trips/", i)))
}
trips <- list_of_trips
#list_of_trips 1 is 2004
#list of trips 16 is 2019
# 2006 to 2018 is [5] to [15]



# Source helper functions -----
source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Local/Nabeel/Protoype/helpers.R")
source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Local/Nabeel/Protoype/tripHelper.R")


a
#source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/helpers2.R")







# User interface ----
ui <- fluidPage(
  titlePanel("Broadband Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Visualize broadband by county"),
      
      selectInput("displayVar", label = "Choose a Variable to Display",
                  choices = c("Broadband", "Avg Trips"), selected = "Broadband"),
      
      sliderInput("yearSlider",
                  label = "year:",
                  min = 2006, max = 2018, value = 2006,
                  step = 1, round = TRUE, ticks = TRUE),

      sliderInput("range", 
                  label = "Range of intrest:",
                  min = 0, max = 100, value = c(0,100))
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
    # displayVariable <- switch(input$displayVar,
    #                           "Broadband" = 1,
    #                           "Avg Trips" = 2)
    
    broadband <- switch(input$yearSlider - 2005, 
                   "2006" = broadband[broadband$year %in% c("2006"),]$broadband,
                   "2007" = broadband[broadband$year %in% c("2007"),]$broadband,
                   "2008" = broadband[broadband$year %in% c("2008"),]$broadband,
                   "2009" = broadband[broadband$year %in% c("2009"),]$broadband,
                   "2010" = broadband[broadband$year %in% c("2010"),]$broadband,
                   "2011" = broadband[broadband$year %in% c("2011"),]$broadband,
                   "2012" = broadband[broadband$year %in% c("2012"),]$broadband,
                   "2013" = broadband[broadband$year %in% c("2013"),]$broadband,
                   "2014" = broadband[broadband$year %in% c("2014"),]$broadband,
                   "2015" = broadband[broadband$year %in% c("2015"),]$broadband,
                   "2016" = broadband[broadband$year %in% c("2016"),]$broadband,
                   "2017" = broadband[broadband$year %in% c("2017"),]$broadband,
                   "2018" = broadband[broadband$year %in% c("2018"),]$broadband)
    
    trip <- switch(input$yearSlider - 2005,
                   "2006" = trips[3]$c_trips_2008.RData$avg_trips,
                   "2007" = trips[4]$c_trips_2008.RData$avg_trips,
                   "2008" = trips[5]$c_trips_2008.RData$avg_trips,
                   "2009" = trips[6]$c_trips_2008.RData$avg_trips,
                   "2010" = trips[7]$c_trips_2008.RData$avg_trips,
                   "2011" = trips[8]$c_trips_2008.RData$avg_trips,
                   "2012" = trips[9]$c_trips_2008.RData$avg_trips,
                   "2013" = trips[10]$c_trips_2008.RData$avg_trips,
                   "2014" = trips[11]$c_trips_2008.RData$avg_trips,
                   "2015" = trips[12]$c_trips_2008.RData$avg_trips,
                   "2016" = trips[13]$c_trips_2008.RData$avg_trips,
                   "2017" = trips[14]$c_trips_2008.RData$avg_trips,
                   "2018" = trips[15]$c_trips_2008.RData$avg_trips,
                   )
                   
    
    color <- switch(input$yearSlider - 2005, # this is temporary to ensure year change is working
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
    
     legend <- paste0("% of county with broadband in ", input$yearSlider)
     print("displayVariable")
     # print(displayVariable)
    
     # if (displayVariable == 1) {
     #   percent_map(broadband, color, legend, input$range[1], input$range[2])
     # }
     # if (displayVariable == 2) {
     #   print("we got here")
     #   trips_map(trip, color, legend)
     # }
     trips_map(trip, color, legend)

  })
  output$value <- renderPrint({input$slider1})
}

# Run app ----
shinyApp(ui, server)
