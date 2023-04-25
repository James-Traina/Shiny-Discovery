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
                           sliderInput("yearSlider",
                                       label = "year:",
                                       min = 2006, max = 2018, value = 2006,
                                       step = 1, round = TRUE, ticks = TRUE),

                           helpText("Welcome to our website exploring the relationship between 
                                    broadband access and consumer behavior in the retail industry. 
                                    On this page, you'll find a series of interactive visualizations 
                                    that allow you to explore the distribution of broadband access 
                                    across counties and how it has changed over time. Specifically, 
                                    we have a series of boxplots showing the distribution of broadband
                                    access each year, as well as a heatmap that allows you to select 
                                    a specific year and see the percentage of households in each 
                                    county with broadband access."),
                           helpText("On our other webpages, you can explore the impact of broadband 
                           access on various aspects of consumer behavior. On the first page, we compare
                           broadband access to the average number of trips taken to brick-and-mortar 
                           retailers each year, and on the second page, we compare it to the average
                           number of unique chains visited per year. On the third page, we compare 
                           broadband access to the number of unique brands purchased per year. Each 
                           page includes two heatmaps and a scatterplot, providing a detailed look 
                           at the relationship between broadband access and each variable, as well 
                           as the chart that plots the different percentiles over time."),
                           helpText("We hope that our website helps you gain a better understanding of 
                                    how the rise of broadband access has impacted consumer behavior 
                                    in the retail industry. If you have any questions or comments, please 
                                    don't hesitate to contact us.")
                       ),

                       mainPanel(
                           plotOutput("broadbandMap"),
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
                            
                            helpText("The first heatmap on this page displays the percentage of households
                            in each county with broadband access in a specific year. As you can see, 
                            there is significant variation across counties in terms of broadband access. 
                            Some counties have nearly universal access, while others have much lower rates. 
                            This heatmap provides important context for understanding the level of broadband access 
                            in each county."),
                            helpText("The second heatmap on this page shows the average number of trips taken to physical 
                            stores per person in each county in a specific year. This data is particularly interesting when 
                            viewed in the context of overall trends in shopping behavior. The average number of trips to 
                            brick-and-mortar retailers has been steadily declining over time, as consumers increasingly rely on 
                            online shopping and delivery services. From 2006 to 2018, the average number of trips taken 
                                     to brick-and-mortar retailers decreased from almost 180 times per year to just over 
                                     166 times per year. This represents a decline of about 3.5 trips per week to just over 
                                     3 trips per week. This trend is reflected in the heatmap, which shows a general decrease 
                                     in average trip counts across counties over time."),
                            helpText("Interestingly, there does not appear to be a strong relationship between 
                                     broadband access and shopping behavior, as there are counties with high levels 
                                     of broadband access that also have high average trip counts, and vice versa. 
                                     The scatterplot on this page further reinforces this lack of correlation 
                                     between broadband access and physical store visits. These findings suggest that 
                                     other factors beyond broadband access may be more important in driving changes 
                                     in shopping behavior over time.")
                        ),
                        
        
                        
                        mainPanel(splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                          plotOutput("tripsBroadbandMap"),
                                  plotOutput("tripsMap")),
                          splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                                  plotOutput("tripsScatter"),
                                  plotOutput("tripLinePlot")),
                          plotOutput("tripPlot")
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
                            helpText("The first heatmap on this page displays the percentage of households in each 
                                     county with broadband access in a specific year, providing important context for 
                                     understanding the level of broadband access in each county."),
                            helpText("The second heatmap on this page shows the average number of unique retail 
                                     chains visited per household in each county in the same year. Interestingly, 
                                     there does not appear to be a strong relationship between broadband access 
                                     and the number of unique retail chains visited, as there are counties with 
                                     high levels of broadband access that also have low numbers of unique retail 
                                     chains visited, and vice versa."),
                            helpText("When viewed in the context of overall trends in shopping behavior, the 
                                     data on the number of unique retail chains visited is particularly 
                                     interesting. From 2006 to 2018, the average number of unique retail 
                                     chains visited by households declined from almost 24 to just over 21. 
                                     This represents an 8% decrease over 12 years. This trend is reflected 
                                     in the heatmap, which shows a general decrease in the number of unique 
                                     retail chains visited across counties over time."),
                            helpText("Finally, the scatterplot on this page compares the percentage of 
                                      households with broadband access to the average number of unique retail 
                                      chains visited per household, providing a more direct visual representation 
                                      of the lack of relationship between these two variables. The scatterplot 
                                      shows no clear trend or correlation between broadband access and the number 
                                      of unique retail chains visited, suggesting that other factors beyond broadband 
                                      access may be more important in driving changes in consumer behavior over time.")
 
                            ),
                            
                          mainPanel(splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                            plotOutput("chainsBroadbandMap"),
                                    plotOutput("chainsMap")),
                            splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                                        plotOutput("chainsScatter"),
                                        plotOutput("chainLinePlot"))
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
                            helpText("The first heatmap on this page displays the percentage of households in each 
                                     county with broadband access in a specific year, providing important context for 
                                     understanding the level of broadband access in each county."),
                            helpText("The second heatmap on this page shows the average number of unique brands 
                                     purchased per household in each county in the same year. Interestingly, 
                                     there does not appear to be a strong relationship between broadband 
                                     access and the number of unique brands purchased, as there are counties 
                                     with high levels of broadband access that also have low numbers of unique 
                                     brands purchased, and vice versa."),
                            helpText("When viewed in the context of overall trends in shopping behavior, the 
                                     data on the number of unique brands purchased is particularly interesting. 
                                     From 2007 to 2018, the average number of unique brands purchased by households 
                                     declined from just under 400 to about 350, representing a 12.5% decrease in unique 
                                     brands. This trend is reflected in the heatmap, which shows a general decrease in 
                                     the number of unique brands purchased across counties over time."),
                            helpText("However, when we look at the graph on the right, which shows the set of all unique 
                                     brands purchased by any household between 2006 and 2018, we see a different trend. Here, 
                                     the number of overall brands purchased has steadily increased, by about 9.8%. This 
                                     suggests that while consumers may be buying fewer unique brands, they are still buying 
                                     more overall, indicating a possible shift in consumer preferences towards larger, more 
                                     established brands."),
                            helpText("Finally, the scatterplot on this page compares the percentage of households with broadband 
                                     access to the average number of unique brands purchased per household, providing a more 
                                     direct visual representation of the lack of relationship between these two variables. The 
                                     scatterplot shows no clear trend or correlation between broadband access and the number of 
                                     unique brands purchased, suggesting that other factors beyond broadband access may be more 
                                     important in driving changes in consumer behavior over time.")
                          ),
                          mainPanel(
                            splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                            plotOutput("brandsBroadbandMap"),
                             plotOutput("brandsMap")),
                            splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                              plotOutput("brandsScatter"),
                              plotOutput("brandLinePlot")
                              )
                          )
                        ))
               )
)
)









