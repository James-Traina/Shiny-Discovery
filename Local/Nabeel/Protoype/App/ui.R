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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    navbarPage("My Application",
               tabPanel(
                   "Broadband",
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
                           plotOutput("map"),
                           plotOutput("plot"),
                       )
                   )
               ),
               tabPanel("Component 2"),
               tabPanel("Component 3")
    )

))
