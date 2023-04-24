#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(maps)
library(mapproj)
library(haven)
library(ggplot2)

# Load data ----
broadband <- read_dta("/Users/nabeelqureshi/Downloads/broadband_county_year.dta")



# Source helper functions -----
source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Local/Nabeel/Protoype/helpers.R")
source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/Local/Nabeel/Protoype/tripHelper.R")



#source("/Users/nabeelqureshi/Documents/7DE/Shiny-Discovery/helpers2.R")


# User interface ----

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    navbarPage("Consumer Behavior and the Rise of Broadband",
               tabPanel(
                   "Broadband",
                   sidebarLayout(
                       sidebarPanel(
                           helpText("Visualize broadband by county"),

                           selectInput("displayVar", label = "Choose a Variable to Display",
                                       choices = c("Broadband", "Avg Trips", "Avg Unique Chains Visited",
                                                   "Avg Unique Brands Purchased"), selected = "Broadband"),

                           sliderInput("yearSlider",
                                       label = "year:",
                                       min = 2006, max = 2018, value = 2006,
                                       step = 1, round = TRUE, ticks = TRUE),

                           sliderInput("range",
                                       label = "Range of intrest:",
                                       min = 0, max = 100, value = c(0,100)),
                           p("blah blah more text here")
                       ),

                       mainPanel(
                           plotOutput("broadbandMap"),
                           #plotOutput("plot"),,
                           plotOutput("boxplots")
                       )
                   )
               ),
               tabPanel("Trip Frequency",
                        sidebarLayout(
                          sidebarPanel(
                            sliderInput("tripYearSlider",
                                        label = "year:",
                                        min = 2006, max = 2018, value = 2006,
                                        step = 1, round = TRUE, ticks = TRUE),
                            
                            sliderInput("tripRange",
                                        label = "Range of intrest:",
                                        min = 0, max = 100, value = c(0,100)),
                            h3("Here we can see the relationship between the number 
                              of trips made to stores and the amount of broadband access in that county")
                        ),
                        
        
                        
                        mainPanel(splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                          plotOutput("tripsMap"),
                                  plotOutput("tripsBroadbandMap")),
                          splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                                  plotOutput("plot"),
                                  plotOutput("tripsScatter"))
                          )
                        )
                        ),

               tabPanel("Unique Chains Visited",
                        sidebarLayout(
                          sidebarPanel(
                            sliderInput("chainYearSlider",
                                        label = "year:",
                                        min = 2006, max = 2018, value = 2006,
                                        step = 1, round = TRUE, ticks = TRUE),
                            
                            sliderInput("chainRange",
                                        label = "Range of intrest:",
                                        min = 0, max = 100, value = c(0,100))
                          ),
                          mainPanel(plotOutput("chainsMap"),
                                    plotOutput("chainsScatter")
                          )
                        )
                        ),
               tabPanel("Unique Brands Purchased",
                        sidebarLayout(
                          sidebarPanel(
                            sliderInput("brandsYearSlider",
                                        label = "year:",
                                        min = 2006, max = 2018, value = 2006,
                                        step = 1, round = TRUE, ticks = TRUE),
                            
                            sliderInput("brandsRange",
                                        label = "Range of intrest:",
                                        min = 0, max = 100, value = c(0,100))
                          ),
                          mainPanel(
                            splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"), 
                             plotOutput("brandsMap"),
                              plotOutput("brandsScatter")
                          )
                        ))
               )
    )

))

