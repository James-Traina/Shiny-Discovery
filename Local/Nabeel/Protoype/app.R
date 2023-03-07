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


#source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/helpers2.R")







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
                   
    
    color <- switch(input$yearSlider - 2005, 
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
    
    legend <- switch(input$yearSlider - 2005, 
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
    
    trip_number(trips[1], "red", legend, 18, 1098)
  })
  #output$value <- renderPrint({input$slider1})
}

# Run app ----
shinyApp(ui, server)
